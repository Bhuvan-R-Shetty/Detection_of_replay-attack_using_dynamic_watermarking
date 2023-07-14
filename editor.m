%for normal working of the system

enableObserver=0;
enableWatermarking=0;
enableAttack = 0;
enableAttack1 = 0;

Ts = 5e-5;
stopTime = 6;

Vin = 100;
Ct = 2.2e-3;
Lt = 1.8e-3;
Rt = 0.2;
Lij = 1.8e-6;
Rij = 0.05;
ILoadInitial = 3;
ILoadFinal = 2;
tLoadChange = 6;
Vref = 40;
Kp = 0.1;
Ki = 6.15;
Kd = 4.6e-4;
N = 2.56e3;
Tf = 1/N;
ICapacity_1 = 3;
ICapacity_2 = 2;

CC_Kp = 0;
CC_Ki = 150;
CC_Kd = 0;
sim("cyberAttack2.slx");
sim("cyberAttack1.slx");

%For the attack of the system one and two
enableAttack = 1;
enableAttack1 = 1;
enableWatermarking=1; %change to 1 and 0 for the detection of th attack
timeOfAttack = 5;
attackTimeDelay = 0.1;

timeOfAttack1 = 5;
attackTimeDelay1 = 0.1;
sim("cyberAttack2.slx");
sim("cyberAttack1.slx");

%for Detection of the replay attack

enableObserver=1;
enableWatermarking=1;
enableAttack = 1;
enableAttack1 = 1;

At = [-1/(Rij*Ct),     1/Ct;
     -1/Lt, -Rt/Lt];
Bt = [0;
     1/Lt];
Mt = [-1/Ct;
      0];
Ht = [1 0];

Bj = [1/(Rij*Ct); 0];
BIl = [-1/Ct; 0];

dguPlant = ss(At,[Bt, Bj, BIl],Ht,0);
dguPlant.StateName = {'Vi','Iti'};
dguPlant.InputName = {'Vti','Vj','Ili'};
dguPlant.OutputName = {'Vi'};
dguPlantD = c2d(dguPlant,Ts);
sim("cyberAttack2.slx");
sim("cyberAttack1.slx");
sim("cyberAttack.slx");
