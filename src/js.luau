--!strict
--!optimize 2

local EmbedJS = {}

function EmbedJS.new(): Embed?
	local self = { __type = "js" :: any }
	
	function self.setColor(Color: Color3 | number): any
		if typeof(Color) == "number" then
			self.Color = Color
			return self
		end

		local R = math.floor(Color.R * 255 + 0.5)
		local G = math.floor(Color.G * 255 + 0.5)
		local B = math.floor(Color.B * 255 + 0.5)
		local Hex = bit32.bor(
			bit32.lshift(R, 16),
			bit32.lshift(G, 8),
			B
		)

		self.Color = Hex
		return self
	end

	function self.setTitle(Title: string): any
		self.Title = Title
		return self
	end

	function self.setURL(url: string): any
		if not string.find(url, "http") then
			warn("Invalid URL for setURL. URL must start with 'http://' or 'https://'.")
			return self
		end

		self.url = url
		return self
	end

	function self.setAuthor(Author: {name: string, icon_url: string, url: string}): any
		self.Author = Author
		return self
	end

	function self.setFooter(Footer: {name: string, icon_url: string}): any
		self.Footer = Footer
		return self
	end

	function self.setDescription(Description: string): any
		self.Description = Description
		return self
	end

	function self.setThumbnail(Thumbnail: string): any
		if not string.find(Thumbnail, "http") then
			warn("Invalid URL for setThumbnail. URL must start with 'http://' or 'https://'.")
			return self
		end

		self.Thumbnail = Thumbnail
		return self
	end

	function self.setImage(Image: string): any
		if not string.find(Image, "http") then
			warn("Invalid URL for setImage. URL must start with 'http://' or 'https://'.")
			return self
		end

		self.Image = Image
		return self
	end

	function self.setTimestamp(): any
		self.Timestamp = true
		return self
	end

	function self.addFields(...: {name: string, value: string, inline: boolean?}): any
		local Fields = {...}
		
		if self.Fields then 
			for _, Field in pairs(Fields) do
				table.insert(self.Fields, Field)
			end
		else 
			self.Fields = Fields
		end
		
		return self
	end
	
	return self
end

export type Embed = {
	setColor: (self: Embed, Color: Color3 | number) -> Embed,
	setTitle: (self: Embed, Title: string) -> Embed,
	setURL: (self: Embed, url: string) -> Embed,
	setAuthor: (self: Embed, Author: {name: string, iconURL: string, url: string}) -> Embed,
	setFooter: (self: Embed, Footer: {name: string, iconURL: string}) -> Embed,
	setDescription: (self: Embed, Description: string) -> Embed,
	setThumbnail: (self: Embed, Thumbnail: string) -> Embed,
	setImage: (self: Embed, Image: string) -> Embed,
	setTimestamp: (self: Embed) -> Embed,
	addFields: (self: Embed, ...{name: string, value: string, inline: boolean?}) -> Embed,
}

export type EmbedJS = {
	Color: number?,
	Title: string?,
	url: string?,
	Author: {name: string, iconURL: string, url: string}?,
	Description: string?,
	Thumbnail: string?,
	Image: string?,
	Timestamp: boolean?,
	Footer: {text: string, iconURL: string}?,
	Fields: {{name: string, value: string, inline: boolean?}}?,
}


return EmbedJS
