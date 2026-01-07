
package businesslogic.shift;

import java.util.ArrayList;

public class ShiftBoard {

    private ArrayList<Shift> shiftlist;

    public void loadWorkshiftBoard() {
        shiftlist = Shift.loadAllTurns();
    }

    public ArrayList<Shift> getShiftlist() {
        loadWorkshiftBoard();
        return   shiftlist;
    }
}
