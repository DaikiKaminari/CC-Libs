# CC-Libs
In my projects I often needed same librairies, such as json and datetime, so I made my own librairies which are made from scratch or a new layer on existing ones.

I made most of librairies compatible with version 1.12+ Minecraft using CC require (or other mods that implements it) but can also work on 1.7 if you add a custom require as native in the ROM.

## How do I use these librairies on 1.7 MC ?
You need to make a resource pack which will modify the ROM, on solo worlds it's just a simple resource pack.
On servers it's the same resource pack you will use but as a server pack (a lot of tutorials explain how to make one, such as https://shockbyte.com/billing/knowledgebase/81/How-to-Set-a-Resource-Pack-to-Your-Minecraft-Server.html).
The resource pack structure is as so :
```
<name-of-your-pack>/assets/computercraft/lua/rom/autorun/require
<name-of-your-pack>/pack.mcmeta
<name-of-your-pack>/pack.png
```
/!\ Make sure `require` file does not contain an extension `.lua` since CC in 1.7 MC version does not supports well file extensions. /!\

With `pack.mcmeta` containing :
```
{
  "pack": {
    "pack_format": 1,
    "description": "Add require as native in CC ROM"
  }
}
```

### Support
I can't guarantee any support of these librairies, but if you find a bug you can make an issue with a maximum of details so I can fix it if I have time.
