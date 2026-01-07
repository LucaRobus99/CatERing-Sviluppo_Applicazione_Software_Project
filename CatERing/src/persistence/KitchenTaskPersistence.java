package persistence;

import businesslogic.KitchenTask.KitchenTask;
import businesslogic.KitchenTask.SummarySheet;
import businesslogic.KitchenTask.TaskEventReceiver;
import businesslogic.menu.Menu;

public class KitchenTaskPersistence implements TaskEventReceiver {
    @Override
    public void updateSummarySheetGenereated(SummarySheet sheet, Menu m) {
            SummarySheet.saveSheet(sheet,m);
    }

    @Override
    public void updateTaskAdded(SummarySheet sheet, KitchenTask n_Kitchen_task) {
            KitchenTask.saveNewTask(sheet.getId(),n_Kitchen_task,sheet.getTaskIndex(n_Kitchen_task));
    }

    @Override
    public void updateTaskDeleted(KitchenTask kitchenTask) {
        KitchenTask.deleteTask(kitchenTask);
    }

    @Override
    public void updateTasksSorted(SummarySheet sheet) {
        SummarySheet.reorderTasks(sheet);
    }

    @Override
    public void updateTaskAssigned(KitchenTask kitchenTask) {
        SummarySheet.setAssignment(kitchenTask);
    }

    @Override
    public void updateTaskCompleted(KitchenTask kitchenTask) {
        KitchenTask.setTaskCompleted(kitchenTask);
    }

    @Override
    public void updateCookhasChanged(KitchenTask kitchenTask) {
        KitchenTask.setCookChanged(kitchenTask);
    }

    @Override
    public void updateCookRemoved(KitchenTask kitchenTask) {
        KitchenTask.setCookChanged(kitchenTask);
    }

    @Override
    public void updateSetNewShift(KitchenTask kitchenTask) {
        KitchenTask.setTurnChanged(kitchenTask);
    }

    @Override
    public void updateSetTaskDetail(KitchenTask kitchenTask) {
        SummarySheet.setDetails(kitchenTask);
    }

    @Override
    public void updateTaskTimeChanged(KitchenTask kitchenTask) {
        KitchenTask.taskTimeChanged(kitchenTask);
    }

    @Override
    public void updateTaskQuantityChanged(KitchenTask kitchenTask) {
        KitchenTask.taskQuantityChanged(kitchenTask);
    }
}
