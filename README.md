# The gen 1 and 2 Cry Library with CryEd.

This repo is intended to both act as a library from which gen 1 or 2 hacks can take from freely (with credit). To assist with this the repo also contains CryEd, a piece of homebrew made by DevEd that allows various cry settings to be easilly edited and tested in real time. In turn if new base cries were created they could easilly be added to CryEd to be used as a base for other cries.

All cries here are free to include in your own hack so long as thier creators are credited, and we encourage you to add any new cries or improvments you make to the library in turn.

# The anatomy of a cry:

Cries have 3 parts, a base cry, a pitch setting and a length. Base cries are the basic sound which the cry is based off, the pitch, as the name suggests, adjusts the pitch of the cry to be higher or lower while the lenth is how fast the cry plays, higher is longer, but unlike typical audio stretching does not adjust the pitch, instead becomming crackly at extreme lengths as the notes are played further apart.

# How to use CryEd:

It is highly reccomended to use CryEd to create and test your cries. It can be run using the .gb in the repo in any game boy or GBC emulator, or you can build it yourself from the source (which you will have to do to add a new base cry) following the instructions below. Once in CryEd there's a few options:

The first menu option from the top is the base cry ID in hex, whichs sets the base cry you will run. To see a list of what cries each ID refers to check the comments in cry_constants.asm. Navigate

The second and 3rd options are Pitch and Length, which do the same things here they do in game. Note that the vanilla games only have room to store the last 3 bytes of Pitch and cry.

You can navigate this menu using left and right to change digit/option and up and down to set it, then press A to play the cry with the current settings. you can save cries to SRAM for later use in the menu with select. The select menu can also import an existing cry, though it is currently limited to the first 256 mons.

Once you are done you can add the cry to the library and then the library to your hack using the methods below.

# How to make a cry based on an existing cry:

- Go to crydata.asm and replace the appropriate placeholder cry with the correct base sound, pitch and legnth in that order.

# How to add a new base cry:

- First create the sound commands, I reccomend using [this editor](http://dotsarecool.com/rgme/tech/gen1cries.html) to make the cries, it includes instuctions on how the cry engine works and what each command does in [this video](https://www.youtube.com/watch?v=gDLpbFXnpeY). 
- Convert the sound commands to the modern format, as described below
- Add the sound itself to audio/cries.asm, remembering to also create a header.
- Add a pointer to the new base cry's header to audio/cry_pointers in the same way as those that exist
- Add a new constant to cry_constants.asm in the same way as those that exist

When you add something, Please add your contribution to credits.txt, and when you use these crys please credit thier creators in your hack.

# How to convert the dotsarecool cry format into a modern gen 1 or gen 2 cry:

- duty = sound_duty /1 /2 /3 /4, where /1 is the high crumb (2 bits), 2 is the next highest crumb and so on. Dutycycle is functionally equivelent to inputting the same argument into sound_duty 4 times

- note = square_note if in the sound channels, noise_note if in the noise channel. The arguments can be copied in 1 for 1, except that the first argument should be reduced by 1. 

- The dotsarecool editor does not support loop and end. Always add sound_ret to the end of each channel (which replaces end), and if you want to loop use sound_loop, which replaces loop.

# Adding a cry to the library:

When you have added your new cry, it would be very nice if you submitted it to the library. To do this create a fork of the library, commit your new cry(s) to the fork, then submit a pull request containing your changes to the library master for approval. Improvments are submitted in the exact same way. 

Once ratings have been sorted out, when a cry is added it will be rated from 1 to 5 stars (*'s) representing the percieved quality at emulating the real cry. The rating scale is below.

\*\*\*\*\* is a perfect cry matching a vanilla cry almost exactly, given the limits of the hardware

\*\*\*\* is a solid cry that is identifyable as the pokemon, but is slightly off.

\*\*\*  is a cry that does the job and sounds reasonably like the pokemons, but is flawed.

\*\* is a well fitting placeholder, but does not match the pokemon's original.

\* is obviously wrong and does not fit the pokemon even as a new cry.

# Fakemons

Fakemon submissions are permitted to the library, so long as the fakemon exists in at least 1 finished or otherwise prominant hack (it need not be gen 2), but they are stored seperatly in fakemoncrydata.asm to retain the ability for the basic crydata to be drag and dropped into an all vanilla mons hack.

# How to port the cry list to your crystal16 based project (NOTE: crystal16 needs an update to accept modern cry macros before it is fully supported):

- Replace audio/cries.asm in your crystal repo with the audio/cries.asm in this repo
- Replace audio/cry_pointers in your crystal repo with the audio/cry_pointers in this repo
- Replace data/pokemon/cries in your crystal repo with the crydata.asm in this repo
- Replace constants/cry_constants.asm in your crystal repo with the cry_constants.asm in this repo
- Check the credits of the crys you have used and add them to your romhacks credits.

# How to build CryEd:

Windows: Within the windows command line, navigate to the root of the repo and run `Build.bat`.

Linux (and Mac?): Within the terminal, navigate to the root of the repo and run `make`. A flow in the current makefile means that `make clean` will have to be run between builds for any change to take effect.
