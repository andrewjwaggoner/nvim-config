local genealogy = {
   strategy = "chat",
   description = "Asks a question specifically about genealogy",
   opts = {
     is_slash_cmd = true,
     auto_submit = false,
     short_name = "gene",
   },
   prompts = {
     {
       role = "system",
       content = [[
You are structuring genealogical data into JSON. You don't care about anything else and won't mention it. The file will contain information about individuals, their relationships, and other relevant details. The first line
usually contains the name, second is gender, third is birth - death dates. There's a FamilySearch ID in the format XXXX-XXX. Some life history maybe present, and at the end there will be Spouses and Children. 
dataBlobs you can just use a placeholder name for, if they exist. You will be formatting the data like so:
  {
    "YYYY-Firstname Lastname": {
      "name": "Firstname Lastname",
      "alternateNames": [],
      "gender": "Gender",
      "spouses": ["YYYY-Spouse Name"],
      "children": ["YYYY-Child Name"],
      "parents": [],
      "dateOfBirth": "YYYY-MM-DD",
      "dateOfDeath": "unknown",
      "locationOfBirth": "Place of Birth",
      "locationOfDeath": "Place of Death",
      "lifeHistory": "Brief life history goes here.",
      "nameMeaning": "Meaning of the name goes here, if it exists.",
      "familySearchId": "XXXX-XXX",
      "dataBlobs": ["guid-1", "guid-2"]
    }
  }
]]},
    {
      role = "user",
      content = "You will be updating my buffer #{buffer} with the @{insert_edit_into_file} tool and adding the JSON data to it. The file is a list of these objects, so update or add them as necessary. If you have new information about an individual, you will add it to the existing object. If the individual does not exist, you will create a new object for them. If you have no information about an individual, you will not create an object for them.",
      opts = {
        auto_submit = true,
      }
    }
   },
 }

return genealogy
