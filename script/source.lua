local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Rio Universal V1.0.0",
   LoadingTitle = "Rayfield Interface Suite",
   LoadingSubtitle = "by Sirius",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "RioUniversal",
      FileName = "RIOSCRIPTCONFIG"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = true
   },
   KeySystem = false,
   KeySettings = {
      Title = " ",
      Subtitle = " ",
      Note = " ",
      FileName = "RIOSCRIPTAUTH",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {" "}
   }
})

local Main = Window:CreateTab("Universal", 4483362458)


