# DanPaint

Dan Lvov's final project for programming in the Assembly8086 language.\
This is a simplified version of [MS Paint](https://support.microsoft.com/en-us/help/4027410/windows-10-open-microsoft-paint).

## Getting Started

These instructions will get you a copy of the project up and running on your local machine.

1) Download and install [Dosbox](https://filehippo.com/download_dosbox/). You should now have `C:\TASM\BIN\`.

2) Download and install the correct version of [7zip](https://www.7-zip.org/) for your machine.

3) Download the project as a zip file, and extract it using [7zip](https://www.7-zip.org/) in `C:\TASM\BIN\`.\
The folder `C:\TASM\BIN\` Should now have the files: 
    * intro.asm
    * line.asm
    * paint.asm
    * r.bat\
![](https://cdn.discordapp.com/attachments/348067542881009665/696686300606103582/unknown.png)
4) Open Dosbox, and type in the console:
    ```mount c: c/
    c:
    cd tasm
    cd bin
    cycles = max
    r paint.asm
then press f9 to run the program.
### Prerequisites
[Dosbox](https://filehippo.com/download_dosbox/)\
[7zip](https://www.7-zip.org/)
## Functionality
![Logo][1]

[1]: https://cdn.discordapp.com/attachments/348067542881009665/696687324712534097/unknown.png
Screen after running the program.
### Colors
Navigating between the background colors: `Up arrow`/ `Down arrow`
Change brush color: `Right arrow`/`Left arrow`

### Circle
Draw a circle, whose center is the position of the mouse: `C`

### Clear Screen
To clear the screen, simply press `Backspace`

### Rectangle
To set the coordinates of the first corner: `L`
To set the coordinates of the second corner and draw the rectangle: `T`

### Clear screen
To clear the screen:`BackSpace`

### Exit
To exit the program: `ESC`

###
## Author
**Dan Lvov**, sophomore of De Shalit high school.

## Acknowledgments
**Hat tip to all contributors, whose code snippets and help are tremendously appreciated**
* The [github community](https://github.community/).
* Omer Shoshani (Yod 9)
* Guy Ofir (Yod 9)
* Dvir Hamdi (Yod 8)
