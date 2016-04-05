function [newPherGrid,newAlarmGrid] = applyDiffusionExtended(pherGrid, alarmGrid, diffusionRate)
n = length(pherGrid) - 2;
newPherGrid = pherGrid;
newAlarmGrid=alarmGrid;
for i = 2:n+1
    for j = 2:n+1
        site = pherGrid(i, j);
        N = pherGrid(i-1, j);
        NE = pherGrid(i-1, j+1);
        E = pherGrid(i, j+1);
        SE = pherGrid(i+1, j+1);
        S = pherGrid(i+1, j);
        SW = pherGrid(i+1, j-1);
        W = pherGrid(i, j-1);
        NW = pherGrid(i-1, j-1);
        newPherGrid(i, j) = diffusionPher(diffusionRate, site, N, NE, E, SE, S, SW, W, NW);
        site = alarmGrid(i, j);
        N = alarmGrid(i-1, j);
        NE = alarmGrid(i-1, j+1);
        E = alarmGrid(i, j+1);
        SE = alarmGrid(i+1, j+1);
        S = alarmGrid(i+1, j);
        SW = alarmGrid(i+1, j-1);
        W = alarmGrid(i, j-1);
        NW = alarmGrid(i-1, j-1);
        newAlarmGrid(i, j) = diffusionPher(diffusionRate, site, N, NE, E, SE, S, SW, W, NW);
    end
end