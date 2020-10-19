%% Speed tf
output = [0.00
0.00
0.00
-116.56
-116.56
-302.39
-302.39
-310.98
-310.98
-313.37
-313.37
-314.22
-314.22
-312.66
-312.66
-311.82
-311.82
-315.79
-315.79
-312.66
-312.66
-312.66
-312.66
-315.79
-315.79
-311.82
-311.82
-312.66
-312.66
-313.37
-313.37
-313.37
-313.37
-311.82
-311.82
-313.37
-313.37
-310.98
-310.98
-313.37
-313.37
-313.37
-313.37
-311.82
-311.82
-314.22
-314.22
-314.22
-314.22
-312.66
-312.66
-313.50
-313.50
-316.64
-316.64
-313.50
-313.50
-315.06
-315.06
-316.64
-316.64
-312.66
-312.66
-314.22
-314.22
-314.22
-314.22
-313.37
-313.37
-314.22
-314.22
-313.37
-313.37
-313.37
-313.37
-314.22
-314.22
-313.37
-313.37
-311.82
-311.82
-315.79
-315.79
-312.53
-312.53
-310.14
-310.14
-312.53
-312.53
-308.15
-308.15
-304.26
-304.26
-307.46
-307.46
-309.00
-309.00
-307.62
-307.62
-309.15
-309.15
-304.26
-304.26
-305.77
-305.77
-309.99
-309.99
-300.89
-300.89
-177.38
-177.38
-48.15
-48.15
0.00
0.00
0.00
]';
output = output * (-1);
input = ones(1, length(output)) * 255;
input(109:116) = 0;
input(1:3) = 0;
time = 1:116;
plot(time, output);
T2 = 5.5;
T1 = time(3);
T = T2 - T1;
yss = 312;
y0 = 0;
uss = 255;
u0 = 0;
K = yss/uss;
H = tf([K], [T, 1])

%% Position tf



output = [
    0
0
0
0
0
0
0
0
0
-1
-1
-1
-1
-1
-1
-1
-1
-1
-1
-1
-1
-1
-1
-1
-1
-1
-1
-1
-1
-1
-1
-1
-1
-1
-1
-1
-1
-1
-1
-1
-1
-1
-1
-1
-1
-1
-1
-1
-1
-1
-1
-1
-1
-20
-20
-350
-350
-726
-726
-1105
-1105
-1485
-1485
-1865
-1865
-2245
-2245
-2626
-2626
-3006
-3006
-3386
-3386
-3766
-3766
-4144
-4144
-4524
-4524
-4904
-4904
-5283
-5283
-5663
-5663
-6043
-6043
-6422
-6422
-6803
-6803
-7185
-7185
-7566
-7566
-7948
-7948
-8330
-8330
-8711
-8711
-9092
-9092
-9472
-9472
-9853
-9853
-10233
-10233
-10614
-10614
-10994
-10994
-11374
-11374
-11753
-11753
-12133
-12133
-12513
-12513
-12893
-12893
-13272
-13272
-13651
-13651
-14029
-14029
-14408
-14408
-14785
-14785
-15163
-15163
-15542
-15542
-15920
-15920
-16298
-16298
-16676
-16676
-17054
-17054
-17431
-17431
-17809
-17809
-18186
-18186
-18563
-18563
-18940
-18940
-19312
-19312
-19683
-19683
-20051
-20051
-20421
-20421
-20788
-20788
-21154
-21154
-21520
-21520
-21887
-21887
-22254
-22254
-22629
-22629
-23006
-23006
-23381
-23381
-23751
-23751
-23974
-23974
-24037
-24037
-24037
-24037
]' * (-1);

time = 1:length(output);
input = ones(1, length(output));
input(1:53) = 0;

plot(time,output);

%% speed tf mai buna

output = [
    0.00
0.00
0.00
0.00
-6.53
-6.53
-6.53
-105.10
-105.10
-105.10
-206.16
-206.16
-206.16
-272.86
-272.86
-272.86
-320.69
-320.69
-320.69
-321.99
-321.99
-321.99
-345.62
-345.62
-345.62
-357.75
-357.75
-357.75
-357.75
-357.75
-357.75
-363.81
-363.81
-363.81
-383.57
-383.57
-383.57
-363.81
-363.81
-363.81
-357.12
-357.12
-357.12
-383.57
-383.57
-383.57
-357.12
-357.12
-357.12
-369.87
-369.87
-369.87
-383.57
-383.57
-383.57
-369.87
-369.87
-369.87
-369.87
-369.87
-369.87
-369.87
-369.87
-369.87
-369.87
-369.87
-369.87
-369.87
-369.87
-369.87
-369.87
-369.87
-369.87
-369.87
-369.87
-369.87
-369.87
-369.87
-369.87
-369.87
-369.87
-369.87
-357.12
-357.12
-357.12
-383.57
-383.57
-383.57
-369.87
-369.87
-369.87
-369.87
-369.87
-369.87
-383.57
-383.57
-383.57
-357.12
-357.12
-357.12
-369.87
-369.87
-369.87
-369.87
-369.87
-369.87
-369.87
-369.87
-369.87
-369.87
-369.87
-369.87
-383.57
-383.57
-383.57
-369.87
-369.87
-369.87
-357.12
-357.12
-357.12
-383.57
-383.57
-383.57
-357.12
-357.12
-357.12
-369.87
-369.87
-369.87
-383.57
-383.57
-383.57
-357.12
-357.12
-357.12
-369.87
-369.87
-369.87
-369.87
-369.87
-369.87
-369.87
-369.87
-369.87
-369.87
-369.87
-369.87
-383.57
-383.57
-383.57
-363.81
-363.81
-363.81
-357.12
-357.12
-357.12
-383.57
-383.57
-383.57
-357.12
-357.12
-357.12
-369.87
-369.87
-369.87
-383.57
-383.57
-383.57
-369.87
-369.87
-369.87
-369.87
-369.87
-369.87
-369.87
-369.87
-369.87
-369.87
-369.87
-369.87
-351.26
-351.26
-351.26
-383.57
-383.57
-383.57
-369.87
-369.87
-369.87
-369.87
-369.87
-369.87
-369.87
-369.87
-369.87
-351.26
-351.26
-351.26
-383.57
-383.57
-383.57
-369.87
-369.87
-369.87
-369.87
-369.87
-369.87
-383.57
-383.57
-383.57
-351.26
-351.26
-351.26
-369.87
-369.87
-369.87
-369.87
-369.87
-369.87
-369.87
-369.87
-369.87
-363.81
-363.81
-363.81
-383.57
-383.57
-383.57
-369.87
-369.87
-369.87
-351.26
-351.26
-351.26
-383.57
-383.57
-383.57
-357.12
-357.12
-357.12
-363.81
-363.81
-363.81
-383.57
-383.57
-383.57
-369.87
-369.87
-369.87
-363.81
-363.81
-363.81
-369.87
-369.87
-369.87
-363.81
-363.81
-363.81
-351.26
-351.26
-351.26
-377.28
-377.28
-377.28
-369.87
-369.87
-369.87
-345.41
-345.41
-345.41
-377.28
-377.28
-377.28
-357.12
-357.12
-357.12
-363.81
-363.81
-363.81
-377.28
-377.28
-377.28
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-369.87
-369.87
-369.87
-351.26
-351.26
-351.26
-377.28
-377.28
-377.28
-363.81
-363.81
-363.81
-377.28
-377.28
-377.28
-363.81
-363.81
-363.81
-351.26
-351.26
-351.26
-377.28
-377.28
-377.28
-357.12
-357.12
-357.12
-363.81
-363.81
-363.81
-377.28
-377.28
-377.28
-351.26
-351.26
-351.26
-357.75
-357.75
-357.75
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-377.28
-377.28
-377.28
-363.81
-363.81
-363.81
-351.26
-351.26
-351.26
-377.28
-377.28
-377.28
-351.26
-351.26
-351.26
-363.81
-363.81
-363.81
-377.28
-377.28
-377.28
-363.81
-363.81
-363.81
-369.87
-369.87
-369.87
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-351.26
-351.26
-351.26
-377.28
-377.28
-377.28
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-377.28
-377.28
-377.28
-345.41
-345.41
-345.41
-369.87
-369.87
-369.87
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-369.87
-369.87
-369.87
-351.26
-351.26
-351.26
-377.28
-377.28
-377.28
-369.87
-369.87
-369.87
-377.28
-377.28
-377.28
-363.81
-363.81
-363.81
-357.12
-357.12
-357.12
-377.28
-377.28
-377.28
-351.26
-351.26
-351.26
-369.87
-369.87
-369.87
-377.28
-377.28
-377.28
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-345.41
-345.41
-345.41
-377.28
-377.28
-377.28
-357.75
-357.75
-357.75
-351.26
-351.26
-351.26
-371.00
-371.00
-371.00
-351.26
-351.26
-351.26
-357.75
-357.75
-357.75
-371.00
-371.00
-371.00
-363.81
-363.81
-363.81
-357.75
-357.75
-357.75
-363.81
-363.81
-363.81
-357.75
-357.75
-357.75
-351.26
-351.26
-351.26
-371.00
-371.00
-371.00
-357.75
-357.75
-357.75
-363.81
-363.81
-363.81
-371.00
-371.00
-371.00
-351.26
-351.26
-351.26
-357.75
-357.75
-357.75
-363.81
-363.81
-363.81
-357.75
-357.75
-357.75
-363.81
-363.81
-363.81
-357.75
-357.75
-357.75
-357.75
-357.75
-357.75
-351.26
-351.26
-351.26
-371.00
-371.00
-371.00
-363.81
-363.81
-363.81
-371.00
-371.00
-371.00
-363.81
-363.81
-363.81
-351.26
-351.26
-351.26
-377.28
-377.28
-377.28
-351.26
-351.26
-351.26
-363.81
-363.81
-363.81
-377.28
-377.28
-377.28
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-351.26
-351.26
-351.26
-377.28
-377.28
-377.28
-363.81
-363.81
-363.81
-351.26
-351.26
-351.26
-377.28
-377.28
-377.28
-351.26
-351.26
-351.26
-369.87
-369.87
-369.87
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-351.26
-351.26
-351.26
-377.28
-377.28
-377.28
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-377.28
-377.28
-377.28
-351.26
-351.26
-351.26
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-371.00
-371.00
-371.00
-363.81
-363.81
-363.81
-351.26
-351.26
-351.26
-377.28
-377.28
-377.28
-345.41
-345.41
-345.41
-363.81
-363.81
-363.81
-371.00
-371.00
-371.00
-351.26
-351.26
-351.26
-371.00
-371.00
-371.00
-351.26
-351.26
-351.26
-363.81
-363.81
-363.81
-377.28
-377.28
-377.28
-357.75
-357.75
-357.75
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-345.41
-345.41
-345.41
-377.28
-377.28
-377.28
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-377.28
-377.28
-377.28
-351.26
-351.26
-351.26
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-351.26
-351.26
-351.26
-377.28
-377.28
-377.28
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-377.28
-377.28
-377.28
-351.26
-351.26
-351.26
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-377.28
-377.28
-377.28
-363.81
-363.81
-363.81
-351.26
-351.26
-351.26
-371.00
-371.00
-371.00
-351.26
-351.26
-351.26
-363.81
-363.81
-363.81
-377.28
-377.28
-377.28
-363.81
-363.81
-363.81
-377.28
-377.28
-377.28
-351.26
-351.26
-351.26
-363.81
-363.81
-363.81
-377.28
-377.28
-377.28
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-357.75
-357.75
-357.75
-363.81
-363.81
-363.81
-351.26
-351.26
-351.26
-377.28
-377.28
-377.28
-363.81
-363.81
-363.81
-357.75
-357.75
-357.75
-371.00
-371.00
-371.00
-351.26
-351.26
-351.26
-357.75
-357.75
-357.75
-357.75
-357.75
-357.75
-357.75
-357.75
-357.75
-357.75
-357.75
-357.75
-371.00
-371.00
-371.00
-357.75
-357.75
-357.75
-345.41
-345.41
-345.41
-371.00
-371.00
-371.00
-345.41
-345.41
-345.41
-357.75
-357.75
-357.75
-371.00
-371.00
-371.00
-345.41
-345.41
-345.41
-351.68
-351.68
-351.68
-357.75
-357.75
-357.75
-357.75
-357.75
-357.75
-357.75
-357.75
-357.75
-371.00
-371.00
-371.00
-357.75
-357.75
-357.75
-345.41
-345.41
-345.41
-377.28
-377.28
-377.28
-345.41
-345.41
-345.41
-357.75
-357.75
-357.75
-377.28
-377.28
-377.28
-363.81
-363.81
-363.81
-371.00
-371.00
-371.00
-351.26
-351.26
-351.26
-363.81
-363.81
-363.81
-357.75
-357.75
-357.75
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-357.75
-357.75
-357.75
-351.26
-351.26
-351.26
-377.28
-377.28
-377.28
-363.81
-363.81
-363.81
-357.75
-357.75
-357.75
-377.28
-377.28
-377.28
-351.26
-351.26
-351.26
-363.81
-363.81
-363.81
-357.75
-357.75
-357.75
-363.81
-363.81
-363.81
-357.75
-357.75
-357.75
-371.00
-371.00
-371.00
-363.81
-363.81
-363.81
-345.41
-345.41
-345.41
-377.28
-377.28
-377.28
-351.26
-351.26
-351.26
-357.75
-357.75
-357.75
-371.00
-371.00
-371.00
-351.26
-351.26
-351.26
-363.81
-363.81
-363.81
-357.75
-357.75
-357.75
-363.81
-363.81
-363.81
-357.75
-357.75
-357.75
-377.28
-377.28
-377.28
-357.75
-357.75
-357.75
-351.26
-351.26
-351.26
-371.00
-371.00
-371.00
-351.26
-351.26
-351.26
-363.81
-363.81
-363.81
-371.00
-371.00
-371.00
-363.81
-363.81
-363.81
-377.28
-377.28
-377.28
-345.41
-345.41
-345.41
-363.81
-363.81
-363.81
-363.81
-363.81
-363.81
-357.75
-357.75
-357.75
-363.81
-363.81
-363.81
-371.00
-371.00
-371.00
-363.81
-363.81
-363.81
-351.26
-351.26
-351.26
-371.00
-371.00
-371.00
-351.26
-351.26
-351.26
-363.81
-363.81
-363.81
-371.00
-371.00
-371.00
-351.26
-351.26
-351.26
-357.75
-357.75
-357.75
-363.81
-363.81
-363.81
-357.75
-357.75
-357.75
-363.81
-363.81
-363.81
-371.00
-371.00
-371.00
-363.81
-363.81
-363.81
-345.41
-345.41
-345.41
-377.28
-377.28
-377.28
-345.41
-345.41
-345.41
-363.81
-363.81
-363.81
-371.00
-371.00
-371.00
-363.81
-363.81
-363.81
-357.75
-357.75
-357.75
-363.81
-363.81
-363.81
-357.75
-357.75
-357.75
-351.26
-351.26
-351.26
-371.00
-371.00
-371.00
-357.75
-357.75
-357.75
-345.41
-345.41
-345.41
-377.28
-377.28
-377.28
-327.85
-327.85
-327.85
-315.30
-315.30
-315.30
-301.83
-301.83
-301.83
-266.79
-266.79
-266.79
-236.48
-236.48
-236.48
-218.29
-218.29
-218.29
-194.03
-194.03
-194.03
-175.84
-175.84
-175.84
-151.59
-151.59
-151.59
-133.40
-133.40
-133.40
-119.47
-119.47
-119.47
-90.95
-90.95
-90.95
-71.83
-71.83
-71.83
-63.67
-63.67
-63.67
-47.54
-47.54
-47.54
-42.44
-42.44
-42.44
-20.37
-20.37
-20.37
-6.53
-6.53
-6.53
0.00
0.00
0.00
0.00
]' * (-1);

time = 0:10/length(output):10-10/length(output);

plot(time,output)
input = ones(1, length(output)) * 255;
input(1:4)=0;
input(1100:length(input)) = 0;

T2 = time(13); %0.63 * yss = 229
T1 = time(5);
T = T2 - T1;
yss = mean(output(300:500));
y0 = 0;
uss = 255;
u0 = 0;
K = yss/uss;
H = tf([K], [T, 1])

figure()
Hz = c2d(H, 0.001, 'zoh')
Ho = feedback(Hz,1)
step(Ho)

Hc = tf([0.06914 1], [0.0137 0.1856 0]);
Hcz = c2d(Hc,0.001, 'tustin')
Ho = feedback(Hcz*Hz, 1);
step(Ho)