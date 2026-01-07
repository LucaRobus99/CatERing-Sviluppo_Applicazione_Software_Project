package businesslogic.KitchenTask;


import businesslogic.event.ServiceInfo;
import businesslogic.menu.Menu;
import businesslogic.recipe.CookingProcedures;
import businesslogic.user.User;
import persistence.BatchUpdateHandler;
import persistence.PersistenceManager;

import java.sql.*;
import java.util.ArrayList;

public class SummarySheet {
    private int id;
    private User chef;
    private ArrayList<KitchenTask> Tasks;
    private ServiceInfo serviceAssigned;

    // CONSTRUCTORS
    public SummarySheet(ServiceInfo ser, User usr) {
        this.chef = usr;
        this.serviceAssigned = ser;
        Tasks = new ArrayList<>();
    }

    // PERSISTENCE METHODS
    public static void saveSheet(SummarySheet sheet, Menu m) {
        String sheetInsert = "INSERT INTO catering.summarysheets (id_chef, id_service) VALUES (?, ?);";
        int[] result = PersistenceManager.executeBatchUpdate(sheetInsert, 1, new BatchUpdateHandler() {
            @Override
            public void handleBatchItem(PreparedStatement ps, int batchCount) throws SQLException {
                ps.setInt(1, sheet.chef.getId());
                ps.setInt(2, sheet.serviceAssigned.getId());
            }

            @Override
            public void handleGeneratedIds(ResultSet rs, int count) throws SQLException {
                if (count == 0) {
                    sheet.id = rs.getInt(1);
                }
            }
        });
        if (result[0] > 0) {
            // SAVING ALL SHEET'S TASKS TOO
            KitchenTask.saveAllNewTasks(sheet, m);
        }
    }

    public static void reorderTasks(SummarySheet sheet) {
        String upd = "UPDATE catering.tasks SET position = ? WHERE id = ?";
        PersistenceManager.executeBatchUpdate(upd, sheet.getTasks().size(), new BatchUpdateHandler() {
            @Override
            public void handleBatchItem(PreparedStatement ps, int batchCount) throws SQLException {
                ps.setInt(1, batchCount);
                ps.setInt(2, sheet.getTasks().get(batchCount).getId());
            }

            @Override
            public void handleGeneratedIds(ResultSet rs, int count) throws SQLException {
            }
        });
    }

    public static void setAssignment(KitchenTask kitchenTask) {
        String update = "UPDATE tasks SET " +
                "`id_turn` = " + kitchenTask.getTurnAssigned().getId() + ", " +
                "`id_cook` = " + (kitchenTask.getCookAssigned() == null ? "null" : kitchenTask.getCookAssigned().getId()) + "" +
                " WHERE `id` = " + kitchenTask.getId();
        PersistenceManager.executeUpdate(update);
    }

    public static void setDetails(KitchenTask kitchenTask) {
        String update = "UPDATE tasks SET " +
                "`timeEstimate` = " + kitchenTask.getTimeEstimate() + ", " +
                "`quantity` = " + kitchenTask.getQuantity() + "" +
                " WHERE `id` = " + kitchenTask.getId();
        PersistenceManager.executeUpdate(update);
    }



    // INSTANCES METHODS
    public void initSheet() {
        Menu menuAssigned = this.serviceAssigned.getMenuAssigned();
        ArrayList<CookingProcedures> allRecipes = menuAssigned.getAllRecipes();
        ArrayList<KitchenTask> tasks=new ArrayList<KitchenTask>();
        for (CookingProcedures recipe : allRecipes) {
            tasks.add(new KitchenTask(recipe));
        }
        this.Tasks=tasks;
    }



    public KitchenTask addTask(CookingProcedures kt) {
        KitchenTask n_Kitchen_task = new KitchenTask(kt);
        Tasks.add(n_Kitchen_task);

        return n_Kitchen_task;
    }



    public void deleteTask(KitchenTask kitchenTask) {
        this.Tasks.remove(kitchenTask);
    }

    public boolean containsTask(KitchenTask kitchenTask) {
        return this.Tasks.contains(kitchenTask);
    }

    public int tasksSize() {
        return this.Tasks.size();
    }

    public boolean isCreator(User user) {
        return (user.getId() == chef.getId());
    }

    public ArrayList<KitchenTask> getTasks() {
        return Tasks;
    }



    public int getTaskIndex(KitchenTask kitchenTask) {
        return Tasks.indexOf(kitchenTask);
    }

    public void sortTasks(KitchenTask kitchenTask, int position){
        this.Tasks.remove(kitchenTask);
        this.Tasks.add(position,kitchenTask);
    }

    @Override
    public String toString() {
        return "-SUMMARY SHEET-" +
                "\n| ID: " + id +
                "\n| Creator: " + chef +
                "\n| Tasks: " + Tasks +
                "\n| serviceAssigned: " + serviceAssigned +
                "\n--------------";
    }

    public int getId() {
        return id;
    }
}
