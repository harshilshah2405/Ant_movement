function newAntGrid = applySenseExtended(antGrid, pherGrid, alarmGrid)

global EMPTY EFFPHER EFFALARM

n = length(antGrid) - 2;
newAntGrid = antGrid;
for i = 2:n+1
    for j = 2:n+1
        if (antGrid(i, j) ~= EMPTY)
            site = antGrid(i, j);
            Nant = antGrid(i-1, j);
            Eant = antGrid(i, j+1);
            NEant = antGrid(i-1,j+1);
            SEant = antGrid(i+1,j+1);
            Sant = antGrid(i+1, j);
            Want = antGrid(i, j-1);
            NWant = antGrid(i-1,j-1);
            SWant = antGrid(i+1,j-1);
           %(alarmGrid(i-1,j))
            Neff = EFFPHER*pherGrid(i-1, j)-EFFALARM*alarmGrid(i-1,j);
            Eeff = EFFPHER*pherGrid(i, j+1)-EFFALARM*alarmGrid(i,j+1);
            NEeff = EFFPHER*pherGrid(i-1, j+1)-EFFALARM*alarmGrid(i-1,j+1);
            SEeff = EFFPHER*pherGrid(i+1, j+1)-EFFALARM*alarmGrid(i+1,j+1);
            Seff = EFFPHER*pherGrid(i+1, j)-EFFALARM*alarmGrid(i+1,j);
            Weff = EFFPHER*pherGrid(i, j-1)-EFFALARM*alarmGrid(i,j-1);
            NWeff = EFFPHER*pherGrid(i-1, j-1)-EFFALARM*alarmGrid(i-1,j-1);
            SWeff = EFFPHER*pherGrid(i+1, j-1)-EFFALARM*alarmGrid(i+1,j-1);
            newAntGrid(i, j) = sense(site, Nant, Eant, Sant, Want, NEant, NWant, SEant, SWant, Neff, Eeff, Seff, Weff, NEeff, NWeff, SEeff, SWeff);
        end
    end
end