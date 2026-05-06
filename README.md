# <div align="center"> - [<ins>**Webber**</ins>](https://github.com/archadiumm/Webber/releases/tag/release) - </div> 

**Webber** is a new better way to utilize Discord webhooks in ROBLOX.

Specifically, this tool is meant for users like me who tend to forget the syntax to send *Embeds* or just plain messages using *HttpService*, who also have previous experience in using either **discord.js** or **discordpy**.

While I couldn't copy their syntaxes directly for obvious reasons, I framed my tool to be easy to learn, memorize, and take up as least space in your code as possible.

# <div align="center"> Documentation </div>

If you have not already, download **Webber** from the [latest release](https://github.com/archadiumm/Webber/releases/tag/release).

Next, create a *sever script* and require **Webber** and get your **Webhook Link** ready like so;
```luau
local Webber = require(path.to.Webber)
local Webhook = "WebhookLink"
```

To send a message using **Webber**, use `Webber.send` like so;
```luau
Webber.send(
	Webhook,
	"Content", -- Type your content text here as a string. If you dont want any content text, use nil.
	{ Embed1, Embed2, Embed3 } -- List your embeds here. If you don't want any embeds and just content text, use {} here.
)
```

Creating *Embeds* requires using the `discord.js` or `discordpy` usage of **Webber**. Remember that using Embeds is optional.

Webber's `discord.js` usage can be reached from **Webber.js** and the `discordpy` usage can be reached from **Webber.py**

You can see more about their usage's in the next sections.

* ## `discord.js` Usage
To create an Embed using the `discord.js` usage of **Webber**, simply start off by using `Webber.js.new`
```luau
local Embed: Webber.jsEmbed = Webber.js.new()
```

Next, you can use [discord.js (14.26.4)](https://discordjs.guide/legacy/popular-topics/embeds)'s EmbedBuilder syntax to build your own Embed. Here is a quick example if you are stuck.
```luau
-- ⚠️ You don't need to include all the elements showcased below. If you want a simpler embed, leave some out.
local Embed: Webber.jsEmbed = Webber.js.new()
Embed.setColor(0x0099ff)
	.setTitle('Some title')
	.setURL('https://discord.js.org/')
	.setAuthor({ name = 'Some name', icon_url = 'https://i.imgur.com/AfFp7pu.png', url = 'https://discord.js.org' })
	.setDescription('Some description here')
	.setThumbnail('https://i.imgur.com/AfFp7pu.png')
	.addFields(
		{ name = 'Regular field title', value = 'Some value here' },
		{ name = 'Inline field title', value = 'Some value here', inline = true }
	)
	.addFields({ name = 'Inline field title', value = 'Some value here', inline = true })
	.setImage('https://i.imgur.com/AfFp7pu.png')
	.setTimestamp()
	.setFooter({ text = 'Some footer text here', icon_url = 'https://i.imgur.com/AfFp7pu.png' })
```

Then, to send this Embed inside your message, just include it in the Embeds parameter when you run `Webber.send`.

* ## `discordpy` Usage
To create an Embed using the `discordpy` usage of **Webber**, simply start off by using `Webber.py.embed`
```luau
local Embed: Webber.pyEmbed = Webber.py.embed({
  title = "Title",
  description = "Description",
  color = Webber.py.Color.Blue()
})
```

To get **colors** for your embed, use `Webber.py.Color`. If the color presets arent to your liking, you can always use `Webber.py.Color.from_rgb` for RGB colors, or you can just use `Embed.set_color(0x000000)` if you want to use a hex code.

Here is a quick example of a simple embed using the `discordpy` usage of **Webber**. 
```luau
local Embed: Webber.pyEmbed = Webber.py.embed({
	title = "Test",
	description = "Test",
	color = 0x00ff00,
})

Embed.add_field({ name="Field name", value="Field value" })
Embed.add_field({ name="Inline field", value="Inline value", inline=true })
```
This example doesn't show as much as the `discord.js` version, but they all both have the same functions with different names, so it would be redundant to repeat myself. You can check all of the functions by typing `Embed.` and then pressing the up and down arrow keys.
