package TestCompitiCucina;

import businesslogic.CatERing;
import businesslogic.KitchenTask.KitchenTaskExcpetion;
import businesslogic.KitchenTask.SummarySheet;
import businesslogic.UseCaseLogicException;
import businesslogic.event.ServiceInfo;
import businesslogic.menu.Menu;
import businesslogic.recipe.CookingProcedures;
import businesslogic.recipe.Recipe;
import businesslogic.shift.Shift;
import businesslogic.user.User;

import java.util.ArrayList;

public class TestCatERing {
    public static void main(String[] args) {
        try{

            CatERing.getInstance().getUserManager().fakeLogin("Marinella");
            System.out.println(CatERing.getInstance().getUserManager().getCurrentUser());

            // LOADING DUMMY DATA
            Menu.loadAllMenus();
            ServiceInfo service = ServiceInfo.loadServiceById(2);
            User x=User.loadUserById(5);
            x.setAvaible(true);
            ArrayList<CookingProcedures> recipes= new ArrayList<> (Recipe.getAllRecipes());

            // TEST: Starting
            System.out.println("\n[TEST]: GENERATING SUMMARY SHEET");
            SummarySheet sheet = CatERing.getInstance().getKtcMgr().generateSummarySheet(service);;

            System.out.println(sheet);

            System.out.println("\n[TEST]: ADD NEW TASK");
            CatERing.getInstance().getKtcMgr().addTask(recipes.get(0));

            System.out.println(sheet);

            System.out.println("\n[TEST]: REORDERING SUMMARY SHEET's TASKS");
            CatERing.getInstance().getKtcMgr().sortTask(sheet.getTasks().get(0), 3);

            System.out.println(sheet);


            System.out.println("\n[TEST]: CHECK SHIFTBOARD");
            ArrayList<Shift> shifts = CatERing.getInstance().getKtcMgr().checkShiftBoard();

            System.out.println(shifts);

            System.out.println("\n[TEST]: TASK ASSIGNMENT (WITH COOK)");
            CatERing.getInstance().getKtcMgr().Assign(sheet.getTasks().get(0), shifts.get(0), x);

            System.out.println(sheet);


            System.out.println("\n[TEST]: TASK ASSIGNMENT (NO COOK)");
            CatERing.getInstance().getKtcMgr().Assign(sheet.getTasks().get(2), shifts.get(0));

            System.out.println(sheet);

            System.out.println("\n[TEST]: TASK INFO DEFINITION");
            CatERing.getInstance().getKtcMgr().setTaskDetails(sheet.getTasks().get(0), 90, 2);

            System.out.println(sheet);
            // TEST: End


        }catch (UseCaseLogicException | KitchenTaskExcpetion e ) {
            System.out.println("Errore sullo scenario principale");
        }
    }
}
