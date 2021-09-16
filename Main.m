
fundamental_freq_level=125;%fundamental er value hard code kore diyechi
zero_crossing_level=12;%zero crossing er value hard code kore diyechi
short_energy_level=0.5;%Short energy er value hard code kore diyechi

%file ta user select korbe. jodio same directory theke select korte hobe
[filename, pathname] = uigetfile ('*.*','Select the Input Audio');
[input,inputfs] = audioread(filename);

%user jei file choose korbe tar input gulo characterFunction.m file e pass
%korechei
[freq,zero_cross,short_ene]=characterFunction(input,inputfs);

%marks er calculation korchi jei value ta male/female detarmine korbe
marks=0.25*(freq/fundamental_freq_level)+(zero_cross/zero_crossing_level)*0.35;
marks = marks+ (0.4*short_ene/short_energy_level);

if marks>0.5 %0.5 ba 0.5 er besi hole Male
    answer ='Male';
else  %0.4 ba 0.4 er kom hole Female
    answer ='Female';
end 


uiwait(msgbox("The answer is : "+answer)); %answer ta message box e show korbe
figure;
plot(input);
TITLE=" is ";
title(append(filename,TITLE,answer)); %Input sound er graph tao show korbe jekhane title e answer tao thakbe
xlabel('Index');
ylabel('Amplitude');
sound(input,inputfs); %Last e sound tao play korbe