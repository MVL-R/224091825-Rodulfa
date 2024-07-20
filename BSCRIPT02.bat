echo Select one of the three shapes:
:menu
echo.
echo 1. Circle
echo 2. Triangle
echo 3. Quadrilateral
set /p choice="Enter your choice: "

if %choice%==1 goto circle
if %choice%==2 goto triangle
if %choice%==3 goto quadrilateral

:circle
set /p radius="Enter the radius of the circle: "
set /a area=314*%radius%*%radius%
echo the area of the circle is %area:~0,-2%.%area:~-2%
pause
goto end

:triangle
set /p a="Enter the length of the first side: "
if "%a%"=="" echo Invalid input! Try again. & goto Triangle
set /p b="Enter the length of the second side: "
if "%b%"=="" echo Invalid input! Try again. & goto Triangle
set /p c="Enter the length of the third side: "
if "%c%"=="" echo Invalid input! Try again. & goto Triangle

::Use powershell for the square root formula
for /f "delims=" %%a in ('powershell.exe -Command "$s=(%a% + %b% + %c%) / 2; [Math]::Round([Math]::Sqrt($s*($s-%a%)*($s-%b%)*($s-%c%)), 2)"') do set area=%%a
echo The area of the triangle is %area%.
if "%a%"=="%b%" (
    if "%b%"=="%c%" (
        echo The triangle is classified as equilateral.
    ) else (
        echo The triangle is classified as isosceles.
    )
) else (
    if "%b%"=="%c%" (
        echo The triangle is classified as isosceles.
    ) else (
        echo The triangle is classified as scalene.
    )
)
pause
goto end

:quadrilateral
set /p length= "Enter the length: "
set /p height= "Enter the height: "
set /a area= %length%*%height%
echo The area of a quadrilateral is %area%

if %length%==%height% (
    echo The quadrilateral is a square.
) 
else (
    echo The quadrilateral is a rectangle.
)
pause
goto end

:end
shutdown
