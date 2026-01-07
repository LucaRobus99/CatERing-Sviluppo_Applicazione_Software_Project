package businesslogic.KitchenTask;

import businesslogic.menu.Menu;
import businesslogic.recipe.CookingProcedures;
import businesslogic.shift.Shift;
import businesslogic.user.User;
import persistence.BatchUpdateHandler;
import persistence.PersistenceManager;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class KitchenTask {
    private int id;

    private CookingProcedures ktAssigned;
    private Shift shiftAssigned;
    private User cookAssigned;
    private int timeEstimate;
    private boolean completed;
    private int quantity;



    public KitchenTask(CookingProcedures tkAssigned) {
        this.ktAssigned = tkAssigned;
        this.completed=false;
    }

    // PERSISTENCE METHODS
    public static void saveAllNewTasks(SummarySheet sheet, Menu m) {
        String sheetInsert = "INSERT INTO catering.tasks (id_sheet, id_recipe, position) VALUES (?, ?, ?);";
        int[] result = PersistenceManager.executeBatchUpdate(sheetInsert, m.getAllRecipes().size(), new BatchUpdateHandler() {
            @Override
            public void handleBatchItem(PreparedStatement ps, int batchCount) throws SQLException {
                ps.setInt(1, sheet.getId());
                ps.setInt(2, m.getAllRecipes().get(batchCount).getId());
                ps.setInt(3, batchCount);
            }

            @Override
            public void handleGeneratedIds(ResultSet rs, int count) throws SQLException {
                sheet.getTasks().get(count).id = rs.getInt(1);
            }
        });
    }

    public static void saveNewTask(int sheet_id, KitchenTask kitchenTask, int p_index) {
        String taskInsert = "INSERT INTO catering.tasks (id_sheet, position, id_recipe) " +
                "VALUES (" + sheet_id + ", " + p_index + ", " + kitchenTask.getKtAssigned().getId() + ");";
        PersistenceManager.executeUpdate(taskInsert);
        kitchenTask.id = PersistenceManager.getLastId();
    }



    public static void deleteTask(KitchenTask kitchenTask) {
        String taskDelete = "DELETE FROM tasks WHERE id = " + kitchenTask.getId();
        PersistenceManager.executeUpdate(taskDelete);
    }



    public static void setTaskCompleted(KitchenTask kitchenTask) {
        String deleteAll = "UPDATE tasks SET completed = 1 WHERE id = " + kitchenTask.getId();
        PersistenceManager.executeUpdate(deleteAll);
    }

    public static void setCookChanged(KitchenTask kitchenTask) {
        String update = "UPDATE tasks SET id_cook = " + (kitchenTask.getCookAssigned() == null ? "null" : kitchenTask.getCookAssigned().getId()) +
                " WHERE id = " + kitchenTask.getId();
        PersistenceManager.executeUpdate(update);
    }

    public static void setTurnChanged(KitchenTask kitchenTask) {
        String deleteAll = "UPDATE tasks SET id_turn = " + kitchenTask.getTurnAssigned().getId() +
                " WHERE id = " + kitchenTask.getId();
        PersistenceManager.executeUpdate(deleteAll);
    }

    public static void taskTimeChanged(KitchenTask kitchenTask) {
        String deleteAll = "UPDATE tasks SET timeEstimate = " + kitchenTask.getTimeEstimate() +
                " WHERE id = " + kitchenTask.getId();
        PersistenceManager.executeUpdate(deleteAll);
    }

    public static void taskQuantityChanged(KitchenTask kitchenTask) {
        String deleteAll = "UPDATE tasks SET quantity = " + kitchenTask.getQuantity() +
                " WHERE id = " + kitchenTask.getId();
        PersistenceManager.executeUpdate(deleteAll);
    }

    public void Assign(Shift shift, User cook) throws KitchenTaskExcpetion {
        if(!(shift.isFull() || shift.isOver())){
            this.shiftAssigned = shift;
            if(cook!=null){
                if (cook .isCook() && cook.isAvaible()){
                    this.cookAssigned = cook;
                }else
                    throw new KitchenTaskExcpetion();
            }
        }else
            throw new KitchenTaskExcpetion();

    }

    public void setCompleted(boolean completed) {
        this.completed = completed;
    }

    public void setTaskDetails(int timeEstimate, int quantity) throws KitchenTaskExcpetion {
        if(this.shiftAssigned!=null&&this.cookAssigned!=null){
            if(!this.shiftAssigned.isOver()){
                this.setQuantity(quantity);
                this.setTimeEstimate(timeEstimate);
            }else
                throw new KitchenTaskExcpetion();
        }else
            throw new KitchenTaskExcpetion();


    }

    public int getId() {
        return id;
    }

    public Shift getTurnAssigned() {
        return shiftAssigned;
    }

    public void setNewShift(Shift shift) throws KitchenTaskExcpetion {
        if(!(shift.isFull()||shift.isOver())){
            this.shiftAssigned = shift;
            if(this.cookAssigned!=null){
                if(!(this.cookAssigned.isAvaible())){
                    this.cookAssigned=null;
                }
            }
        }else{
           throw new KitchenTaskExcpetion();
        }

    }

    public User getCookAssigned() {
        return cookAssigned;
    }

    public void setCook(User cook) throws KitchenTaskExcpetion {
        if(cook!=null){
            if (cook.isCook() &&  cook.isAvaible() && !this.isCompleted()) {
                this.cookAssigned = cook;
            }else{
                throw new KitchenTaskExcpetion();
            }
        }else
            throw new KitchenTaskExcpetion();
    }

    public void removeCook() throws KitchenTaskExcpetion {
        if(this.cookAssigned!=null){
            this.cookAssigned=null;
        }else
            throw new KitchenTaskExcpetion();
    }

    public CookingProcedures getKtAssigned() {
        return ktAssigned;
    }

    public int getTimeEstimate() {
        return timeEstimate;
    }

    public void setTimeEstimate(int timeEstimate) {
        this.timeEstimate = timeEstimate;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public boolean isCompleted() {return completed;}
    @Override
    public String toString() {
        return "\n\tTask" +
                "id: " + id +
                ", ktAssigned: " + ktAssigned +
                ", turnAssigned: " + shiftAssigned +
                ", cookAssigned: " + cookAssigned +
                ", timeEstimate: " + timeEstimate +
                ", completed: " + completed +
                ", quantity: " + quantity;
    }
}
