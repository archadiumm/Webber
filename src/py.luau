--!strict
--!optimize 2

local EmbedPY = {}

EmbedPY.Color = {
	Blue = function(): number
		return 0x0000ff
	end,
	Red = function(): number
		return 0xff0000
	end,
	Green = function(): number
		return 0x00ff00
	end,
	
	Yellow = function(): number
		return 0xffff00
	end,
	Magenta = function(): number
		return 0xff00ff
	end,
	Cyan = function(): number
		return 0x00ffff
	end,
	
	White = function(): number
		return 0xffffff
	end,
	Black = function(): number
		return 0x000000
	end,
	
	from_rgb = function(r: number, g: number, b: number)
		return bit32.bor(
			bit32.lshift(r, 16),
			bit32.lshift(g, 8),
			b
		)
	end,
}

function EmbedPY.embed(data: { title: string?, description: string?, color: number? }): Embed
	local self = { __type = "py" :: any }
	
	self.title = data.title
	self.description = data.description
	self.color = data.color or 0xffffff
	
	self.fields = {}
	
	function self.add_field(field: { name: string, value: string, inline: boolean? })
		table.insert(self.fields, field)
	end
	
	function self.set_footer(text: string)
		self.footer = text
	end
	
	function self.set_author(name: string)
		self.author = name
	end
	
	function self.set_title(title: string)
		self.title = title
	end
	
	function self.set_description(description: string)
		self.description = description
	end
	
	function self.set_color(color: number)
		self.color = color
	end
	
	function self.set_image(image: string)
		self.image = image
	end
	
	function self.set_thumbnail(thumbnail: string)
		self.thumbnail = thumbnail
	end
	
	function self.set_timestamp()
		self.timestamp = true
	end
	
	function self.set_url(url: string)
		self.url = url
	end
	
	return self
end

export type Embed = {
	set_title: (title: string) -> (),
	set_description: (description: string) -> (),
	set_color: (color: number) -> (),
	set_footer: (text: string) -> (),
	set_author: (name: string) -> (),
	set_image: (image: string) -> (),
	set_thumbnail: (thumbnail: string) -> (),
	set_timestamp: () -> (),
	set_url: (url: string) -> (),
	add_field: (field: { name: string, value: string, inline: boolean? }) -> (),
}

export type EmbedPY = {
	color: number?,
	title: string?,
	url: string?,
	author: {name: string, iconURL: string, url: string}?,
	description: string?,
	thumbnail: string?,
	image: string?,
	timestamp: boolean?,
	footer: {text: string, iconURL: string}?,
	fields: {{name: string, value: string, inline: boolean?}}?,
}

return EmbedPY
