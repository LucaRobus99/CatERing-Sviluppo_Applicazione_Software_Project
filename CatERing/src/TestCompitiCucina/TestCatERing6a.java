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

public class TestCatERing6a {
    public static void main(String args []){
        try{

            CatERing.getInstance().getUserManager().fakeLogin("Marinella");
            System.out.println(CatERing.getInstance().getUserManager().getCurrentUser());

            // LOADING DUMMY DATA
            Menu.loadAllMenus();
            ServiceInfo service = ServiceInfo.loadServiceById(2);
            User x=User.loadUserById(5);
            x.setAvaible(true);
            SummarySheet sheet = CatERing.getInstance().getKtcMgr().generateSummarySheet(service);;
            ArrayList<Shift> shifts = CatERing.getInstance().getKtcMgr().checkShiftBoard();




            System.out.println("TASK ASSIGNMENT:\n");
            CatERing.getInstance().getKtcMgr().Assign(sheet.getTasks().get(0), shifts.get(0), x);
            System.out.println(sheet);


            System.out.println("\nTASK INFO DEFINITION");
            CatERing.getInstance().getKtcMgr().setTaskDetails(sheet.getTasks().get(0), 90, 2);
            System.out.println(sheet);

            System.out.println("\n[TEST]:TASK CHANGE QUANTITY");
            CatERing.getInstance().getKtcMgr().changeTaskQuantity(sheet.getTasks().get(0), 5);
            System.out.println(sheet);

            System.out.println("\n[TEST]:TASK CHANGE TIMEESTIMATED");
            CatERing.getInstance().getKtcMgr().changeTaskTimeEstimate(sheet.getTasks().get(0), 160);
            System.out.println(sheet);
            // TEST: End


        }catch (UseCaseLogicException | KitchenTaskExcpetion e ) {
            System.out.println("Errore sull' estensione 6a" + e);
        }

    }

}
