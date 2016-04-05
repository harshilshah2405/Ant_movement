%  test10_4e2MATLAB.m

global MAXPHER EVAPORATE DEPOSIT ALARM EFFPHER EFFALARM

MAXPHER = 50;
EVAPORATE = 1;
DEPOSIT = 2;
ALARM = 10;
EFFPHER = 0.5;
EFFALARM = 0.5;
%% Perform simulation and animation
%%%rng(1); % seed random number generator
n = 7;
probAnt = 0.1;
diffusionRate = 0.1;
t = 9;
[antGrids, pherGrids] = ants(n, probAnt, diffusionRate, t);
M = showGraphs(antGrids, pherGrids)
%%
movie(M, 1, 2)

%% Another simulation and animation
rand('state', 1); % seed random number generator
[antGrids, pherGrids] = ants(21, 0.1, 0.01, 20);
M = showGraphs(antGrids, pherGrids)

%% Another simulation and animation
rand('state', 3); % seed random number generator
[antGrids, pherGrids] = ants(31, 0.05, 0.01, 50);
M = showGraphs(antGrids, pherGrids)
%%
M = showAntGraphs(antGrids)