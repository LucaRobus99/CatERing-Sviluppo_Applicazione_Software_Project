package businesslogic.KitchenTask;

import businesslogic.CatERing;
import businesslogic.event.ServiceInfo;
import businesslogic.UseCaseLogicException;
import businesslogic.menu.Menu;
import businesslogic.recipe.CookingProcedures;
import businesslogic.shift.Shift;
import businesslogic.user.User;

import java.util.ArrayList;

public class KitchenTaskManager {

    // INSTANCES VARIABLES
    private SummarySheet currentSheet;
    private ArrayList<TaskEventReceiver> eventReceivers = new ArrayList<>();

    // INSTANCES METHODS
    public SummarySheet generateSummarySheet(ServiceInfo ser) throws UseCaseLogicException, KitchenTaskExcpetion {
        User currentUser = CatERing.getInstance().getUserManager().getCurrentUser();
        if (!currentUser.isChef())
            throw new UseCaseLogicException();

        if (ser.getMenuAssigned() == null)
            throw new KitchenTaskExcpetion();

        SummarySheet sh = new SummarySheet(ser, currentUser);

        sh.initSheet();


        this.setCurrentSheet(sh);
        notifySheetCreated(this.currentSheet, ser.getMenuAssigned());

        return currentSheet;
    }

    public SummarySheet openSheet(SummarySheet sheet) throws UseCaseLogicException, KitchenTaskExcpetion {
        User user = CatERing.getInstance().getUserManager().getCurrentUser();
        if (!(user.isChef()))
            throw new UseCaseLogicException();

        if (!(sheet.isCreator(user)))
            throw new KitchenTaskExcpetion();

        this.setCurrentSheet(sheet);

        return currentSheet;
    }



    public KitchenTask addTask(CookingProcedures kt) throws KitchenTaskExcpetion {
        KitchenTask n_Kitchen_task=null;
        if (currentSheet != null){
             n_Kitchen_task = currentSheet.addTask(kt);
            this.notifyTaskAdded(currentSheet, n_Kitchen_task);
        }else{
            throw new KitchenTaskExcpetion();
        }

        return n_Kitchen_task;
    }

    public void deleteTask(KitchenTask kitchenTask) throws UseCaseLogicException {
        if (currentSheet != null && currentSheet.containsTask(kitchenTask)) {
            currentSheet.deleteTask(kitchenTask);
            notifyTaskDeleted(kitchenTask);
        }
        else
            throw new UseCaseLogicException();




    }

    public void sortTask(KitchenTask kitchenTask, int position) throws IllegalArgumentException, UseCaseLogicException {
        if (currentSheet != null && currentSheet.containsTask(kitchenTask)){
            if (position > 0 && position < currentSheet.tasksSize()){
                currentSheet.sortTasks(kitchenTask,position);
                notifyTasksSorted(currentSheet);
            }
            else
                throw new IllegalArgumentException();
        }else{
            throw new UseCaseLogicException();
        }

    }

    public void Assign(KitchenTask task, Shift shift, User cook) throws UseCaseLogicException, KitchenTaskExcpetion {
        if (currentSheet != null && (currentSheet.containsTask(task))){
            task.Assign(shift, cook);
            this.notifyAssignedTask(task);
        }
        else
            throw new UseCaseLogicException();

    }

    public void Assign(KitchenTask task, Shift shift) throws UseCaseLogicException, KitchenTaskExcpetion {
        this.Assign(task, shift, null);
    }

    public void setCompleted(KitchenTask task) throws UseCaseLogicException {
        if (currentSheet != null && currentSheet.containsTask(task)){
            task.setCompleted(true);
            this.notifysetTaskCompleted(task);
        }else
            throw new UseCaseLogicException();

    }

    public void setNewCook(KitchenTask task, User cook) throws UseCaseLogicException, KitchenTaskExcpetion {
        if (currentSheet != null && currentSheet.containsTask(task)){
            task.setCook(cook);
            this.notifyCookhasChanged(task);
        }else{
            throw new UseCaseLogicException();
        }




    }

    public void RemoveCook(KitchenTask task) throws UseCaseLogicException, KitchenTaskExcpetion {
        if (currentSheet != null && currentSheet.containsTask(task)){
            task.removeCook();
           this.notifyCookRemoved(task);
        }else{
            throw new UseCaseLogicException();
        }
    }

    public void setNewShift(KitchenTask task, Shift shift) throws UseCaseLogicException, KitchenTaskExcpetion {
        if (currentSheet != null && currentSheet.containsTask(task)){
            task.setNewShift(shift);
            this.notifysetNewShift(task);}
        else
            throw new UseCaseLogicException();
    }

    public void setTaskDetails(KitchenTask task, int timeEstimate, int quantity) throws UseCaseLogicException, KitchenTaskExcpetion {
        if (currentSheet != null && currentSheet.containsTask(task)){
            task.setTaskDetails(timeEstimate, quantity);
            this.notifysetDetailsTask(task);
        }else
            throw new UseCaseLogicException();


    }

    public void changeTaskTimeEstimate(KitchenTask task, int timeEstimate) throws UseCaseLogicException {
        if (currentSheet != null && currentSheet.containsTask(task)){
            task.setTimeEstimate(timeEstimate);
            this.notifyTaskTimeChanged(task);
        }else
            throw new UseCaseLogicException();
    }

    public void changeTaskQuantity(KitchenTask task, int quantity) throws UseCaseLogicException {
        if (currentSheet != null && currentSheet.containsTask(task)){
            task.setQuantity(quantity);
            this.notifyTaskQuantityChanged(task);
        }else
            throw new UseCaseLogicException();

    }
public ArrayList<Shift> checkShiftBoard(){
        ArrayList<Shift> shiftlist  = CatERing.getInstance().getShiftManager().checkShiftBoard();
        return shiftlist;
}
    public void setCurrentSheet(SummarySheet sheet) {
        this.currentSheet = sheet;
    }


    // EVENT SENDER METHODS
    private void notifySheetCreated(SummarySheet sheet, Menu m) {
        for (TaskEventReceiver er : eventReceivers) {
            er.updateSummarySheetGenereated(sheet, m);
        }
    }



    private void notifyTaskAdded(SummarySheet sheet, KitchenTask kitchenTask) {
        for (TaskEventReceiver er : eventReceivers) {
            er.updateTaskAdded(sheet, kitchenTask);
        }
    }

    private void notifyTaskDeleted(KitchenTask kitchenTask) {
        for (TaskEventReceiver er : eventReceivers) {
            er.updateTaskDeleted(kitchenTask);
        }
    }

    private void notifyTasksSorted(SummarySheet sheet) {
        for (TaskEventReceiver er : eventReceivers) {
            er.updateTasksSorted(sheet);
        }
    }

    private void notifyAssignedTask(KitchenTask kitchenTask) {
        for (TaskEventReceiver er : eventReceivers) {
            er.updateTaskAssigned(kitchenTask);
        }
    }

    private void notifysetTaskCompleted(KitchenTask kitchenTask) {
        for (TaskEventReceiver er : eventReceivers) {
            er.updateTaskCompleted(kitchenTask);
        }

    }

    private void notifyCookhasChanged(KitchenTask kitchenTask) {
        for (TaskEventReceiver er : eventReceivers) {
            er.updateCookhasChanged(kitchenTask);
        }
    }

    private void notifyCookRemoved(KitchenTask kitchenTask) {
        for (TaskEventReceiver er : eventReceivers) {
            er.updateCookRemoved(kitchenTask);
        }

    }

    private void notifysetNewShift(KitchenTask kitchenTask) {
        for (TaskEventReceiver er : eventReceivers) {
            er.updateSetNewShift(kitchenTask);
        }
    }

    private void notifysetDetailsTask(KitchenTask kitchenTask) {
        for (TaskEventReceiver er : eventReceivers) {
            er.updateSetTaskDetail(kitchenTask);
        }

    }

    private void notifyTaskTimeChanged(KitchenTask kitchenTask) {
        for (TaskEventReceiver er : eventReceivers) {
            er.updateTaskTimeChanged(kitchenTask);
        }

    }

    private void notifyTaskQuantityChanged(KitchenTask kitchenTask) {
        for (TaskEventReceiver er : eventReceivers) {
            er.updateTaskQuantityChanged(kitchenTask);
        }

    }

    public void addEventReceiver(TaskEventReceiver er) {
        this.eventReceivers.add(er);
    }
}
