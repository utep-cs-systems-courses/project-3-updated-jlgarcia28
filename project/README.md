## Description
This project was about to build up a graphical LCD toy.I utilized the knowledge I have gained working with the buttons and buzzer. This is basically the movements between the ranges of the different shapes. 
## Step 1:
First you need to clone the project, and choose a directory where its going to be save. Once in that directory the command it used: 
```shell
> git clone https://github.com/utep-cs-systems-courses/project-3-updated-jlgarcia28
```
And accesss the file downloaded
## How to compile the toy:
To compile the toy its neccessary to move the project folder and connecting the MSP430 device to the computer and use the next command 

```shell
> make  load
```

Once done this the program will run and the whole toy will start by using the following controls:

```shell
> S1:Left 
> S2:Up
> S3:Down
> S4:Right
```

Music will activate when you move the respective shapes or when there's a collision with the limit borders established:



Everytime you move the shape the display shows direction:

```shell
>  Direction 
>  Left
```

