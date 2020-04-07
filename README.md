# DanPaint

Dan Lvov's final project for programming in the Assembly8086 language.\
This is a simplified version of [MS Paint](https://support.microsoft.com/en-us/help/4027410/windows-10-open-microsoft-paint).
## Table of content
- [Getting Started](#Getting-Started)
- [Prerequisites](#Prerequisites)
- [Functionality](#Functionality)
    - [Colors](#CiColorsrcle)
    - [Circle](#Circle)
    - [Rectangle](#Rectangle)
    - [Clear screen](#Clear-screen)
    - [Exit](#Exit)
- [Flow Chart](#Flow-Chart)
- [Author](#Author)
- [Acknowledgments](#Acknowledgments)

## Getting Started

These instructions will get you a copy of the project up and running on your local machine.

1) Download and install [Dosbox](https://filehippo.com/download_dosbox/).

2) Download and install the correct version of [winrar](https://www.win-rar.com/download.html?&L=0) for your machine.

3) Download [TASM.rar](https://github.com/IMakeBotsForYou/Assembly-Paint/raw/master/TASM.rar), and extract it using [winrar](https://www.7-zip.org/) in your `C:` drive.\
The folder `C:\TASM\BIN\` Should now have the files: 
    * intro.asm
    * paint.asm
    * r.bat\
![](https://cdn.discordapp.com/attachments/348067542881009665/696717685857321070/unknown.png)

4) Open Dosbox, and type in the console:
    ```
    mount c: c:/
    c:
    cd tasm
    cd bin
    cycles = max
    paint.asm
then press f9 to run the program.
### Prerequisites
[Dosbox](https://filehippo.com/download_dosbox/)\
[winrar](https://www.win-rar.com/download.html?&L=0)
## Functionality
![Instructions][1]

[1]: https://cdn.discordapp.com/attachments/348067542881009665/696687324712534097/unknown.png
Screen after running the program.
### Colors
Navigating between the background colors: `Up arrow`/ `Down arrow`
Change brush color: `Right arrow`/`Left arrow`

### Circle
Draw a circle, whose center is the position of the mouse: `C`

### Rectangle
To set the coordinates of the first corner: `L`\
To set the coordinates of the second corner and draw the rectangle: `T`

### Clear screen
To clear the screen:`BackSpace`

### Exit
To exit the program: `ESC`

## Flow Chart
A flowchart is a type of diagram that represents a workflow or process.\
The flow chart demonstrates how the code jumps between processes and how it functions.\
[Download](https://github.com/IMakeBotsForYou/Assembly-Paint/raw/master/DanPaint.pdf) the flow chart as PDF.

## Author
**Dan Lvov**, of De Shalit high school.

## Acknowledgments
**Hat tip to all contributors, whose code snippets and help are tremendously appreciated**
* The [github community](https://github.community/).
* Omer Shoshani (Yod 9)
* Guy Ofir (Yod 9)
* Dvir Hamdi (Yod 8)
