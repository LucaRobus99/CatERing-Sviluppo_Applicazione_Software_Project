package businesslogic.KitchenTask;

import businesslogic.menu.Menu;

public interface TaskEventReceiver {
    void updateSummarySheetGenereated(SummarySheet sheet, Menu m);

    void updateTaskAdded(SummarySheet sheet, KitchenTask task);

    void updateTaskDeleted(KitchenTask kitchenTask);

    void updateTasksSorted(SummarySheet sheet);

    void updateTaskAssigned(KitchenTask kitchenTask);

    void updateTaskCompleted(KitchenTask kitchenTask);

    void updateCookhasChanged(KitchenTask kitchenTask);

    void updateCookRemoved(KitchenTask kitchenTask);

    void updateSetNewShift(KitchenTask kitchenTask);

    void updateSetTaskDetail(KitchenTask kitchenTask);

    void updateTaskTimeChanged(KitchenTask kitchenTask);

    void updateTaskQuantityChanged(KitchenTask kitchenTask);
}
