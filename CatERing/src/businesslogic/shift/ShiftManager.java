package businesslogic.shift;

import java.util.ArrayList;

public class ShiftManager {
    private ShiftBoard wb;

    public ShiftManager() {
        this.wb = new ShiftBoard();
    }

    public ArrayList<Shift> checkShiftBoard() {
        return wb.getShiftlist();
    }
}
