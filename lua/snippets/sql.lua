local sql_snippets = {}

function sql_snippets.init(ls, m)
  ls.add_snippets("sql", {

    -- List all user sessions (basic)
    m.s("sess", {
      m.t({
        "SELECT",
        "    session_id,",
        "    status,",
        "    login_name,",
        "    host_name,",
        "    program_name",
        "FROM sys.dm_exec_sessions",
        "WHERE is_user_process = 1;",
      }),
    }),

    -- Show currently running requests + SQL text
    m.s("running", {
      m.t({
        "SELECT",
        "    r.session_id,",
        "    r.status,",
        "    r.command,",
        "    r.cpu_time,",
        "    r.total_elapsed_time,",
        "    t.text",
        "FROM sys.dm_exec_requests r",
        "CROSS APPLY sys.dm_exec_sql_text(r.sql_handle) t",
        "WHERE r.session_id <> @@SPID;",
      }),
    }),

    -- Filter running queries by program name (dadbod/sqlcmd)
    m.s("dadbod", {
      m.t({
        "SELECT",
        "    r.session_id,",
        "    r.status,",
        "    r.command,",
        "    r.cpu_time,",
        "    r.total_elapsed_time,",
        "    s.program_name,",
        "    t.text",
        "FROM sys.dm_exec_requests r",
        "JOIN sys.dm_exec_sessions s",
        "  ON r.session_id = s.session_id",
        "CROSS APPLY sys.dm_exec_sql_text(r.sql_handle) t",
        "WHERE s.program_name LIKE '%sqlcmd%';",
      }),
    }),

    -- Kill a session (cursor jumps to PID)
    m.s("kill", {
      m.t("KILL "),
      m.i(1, "session_id"),
      m.t(";"),
    }),

    -- Find blockers / blocking chains
    m.s("block", {
      m.t({
        "SELECT",
        "    r.session_id,",
        "    r.blocking_session_id,",
        "    r.status,",
        "    r.wait_type,",
        "    r.wait_time,",
        "    t.text",
        "FROM sys.dm_exec_requests r",
        "CROSS APPLY sys.dm_exec_sql_text(r.sql_handle) t",
        "WHERE r.blocking_session_id <> 0;",
      }),
    }),

    -- Kill all sessions for current login (dangerous)
    m.s("killme", {
      m.t({
        "DECLARE @sql NVARCHAR(MAX) = N'';",
        "",
        "SELECT @sql += N'KILL ' + CAST(session_id AS NVARCHAR(10)) + N';'",
        "FROM sys.dm_exec_sessions",
        "WHERE login_name = SUSER_NAME()",
        "  AND session_id <> @@SPID;",
        "",
        "EXEC sp_executesql @sql;",
      }),
    }),

    -- MERGE INTO
    m.s("merge", {
      m.t({
        "MERGE INTO ",
      }),
      m.i(1, "target_table"),
      m.t({" AS target", "USING "}),
      m.i(2, "source_table"),
      m.t({" AS source", "ON "}),
      m.i(3, "join_condition"),
      m.t({"", "WHEN MATCHED THEN", "    UPDATE SET "}),
      m.i(4, "column1 = source.column1, column2 = source.column2"),
      m.t({"", "WHEN NOT MATCHED THEN", "    INSERT (column1, column2) VALUES (source.column1, source.column2);"}),
    }),
  })
end

return sql_snippets
