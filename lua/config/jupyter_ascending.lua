local jupyter_ascending = {}

-- NOTE: This works by installing an extension for jupyter.
-- pip install jupyter_ascending && \
-- jupyter nbextension install jupyter_ascending --sys-prefix --py && \
-- jupyter nbextension enable jupyter_ascending --sys-prefix --py && \
-- jupyter serverextension enable jupyter_ascending --sys-prefix --py
-- 
-- Afterwards, you can use the following command to make a notebook and py file.
-- python -m jupyter_ascending.scripts.make_pair --base <name>
function jupyter_ascending.config()
end

return jupyter_ascending
