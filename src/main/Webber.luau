--!strict
--!optimize 2

local HttpService = game:GetService("HttpService")

local Webber = {}
type embed = { __type: string }

local js = require("@self/js")
local py = require("@self/py")

type _jsEmbed = js.EmbedJS
type _pyEmbed = py.EmbedPY

Webber = {
	send = function(Webhook: string, Content: string?, Embeds: {any}): ()
		local EmbedsList: {any} = {}
		
		for _, _embed: embed in pairs(Embeds) do
			if _embed.__type == "js" then
				local Embed = _embed :: _jsEmbed
				
				table.insert(EmbedsList, {
					["title"] = Embed.Title,
					["description"] = Embed.Description,
					["color"] = Embed.Color,
					["url"] = Embed.url,
					["author"] = Embed.Author,
					["thumbnail"] = { url = Embed.Thumbnail },
					["image"] = { url = Embed.Image },
					["footer"] = Embed.Footer,
					["fields"] = Embed.Fields,
				})
			elseif _embed.__type == "py" then
				local Embed = _embed :: _pyEmbed

				table.insert(EmbedsList, {
					["title"] = Embed.title,
					["description"] = Embed.description,
					["color"] = Embed.color,
					["url"] = Embed.url,
					["author"] = Embed.author,
					["thumbnail"] = Embed.thumbnail and { url = Embed.thumbnail } or nil,
					["image"] = Embed.image and { url = Embed.image } or nil,
					["footer"] = Embed.footer,
					["fields"] = Embed.fields
				})
			end
		end
		
		local Encode = HttpService:JSONEncode({
			["content"] = Content,
			["embeds"] = EmbedsList
		})
		
		local Success: boolean, Error: string = pcall(function()
			HttpService:PostAsync(Webhook, Encode, Enum.HttpContentType.ApplicationJson)
			return ""
		end)
		
		if Success then 
			return
		end
		
		if string.find(Error, "HTTP 400") then
			warn("[EmbedModule] HTTP 400: Syntax Error")
			warn(" * Check to make sure your setImage, setURL, setThumbnail, etc. links are correct.")
		elseif string.find(Error, "HTTP 429") then
			warn("[EmbedModule] HTTP 429: Too Many Requests.")
			warn(" * You are sending too many requests! Try again later.")
		elseif string.find(Error, "HTTP 401") then
			warn("[EmbedModule] HTTP 401: Incorrect Webhook Link.")
			warn(" * Could not send a request. Is your webhook link correct?")
		else
			error(Error)
		end
	end,
	
	js = js,
	py = py
}

export type jsEmbed = js.Embed
export type pyEmbed = py.Embed
return Webber
