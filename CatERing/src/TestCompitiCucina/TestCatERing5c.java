package TestCompitiCucina;

import businesslogic.CatERing;
import businesslogic.KitchenTask.KitchenTaskExcpetion;
import businesslogic.KitchenTask.SummarySheet;
import businesslogic.UseCaseLogicException;
import businesslogic.event.ServiceInfo;
import businesslogic.menu.Menu;
import businesslogic.recipe.Recipe;
import businesslogic.shift.Shift;
import businesslogic.user.User;

import java.util.ArrayList;

public class TestCatERing5c {
    public static void main (String args []){
        try {
            CatERing.getInstance().getUserManager().fakeLogin("Marinella");
            System.out.println(CatERing.getInstance().getUserManager().getCurrentUser());

            // LOADING DUMMY DATA
            Menu.loadAllMenus();
            ServiceInfo service = ServiceInfo.loadServiceById(2);
            User x=User.loadUserById(5);
            x.setAvaible(true);


            ArrayList<Shift> shifts = CatERing.getInstance().getKtcMgr().checkShiftBoard();
            SummarySheet sheet = CatERing.getInstance().getKtcMgr().generateSummarySheet(service);;



            System.out.println("\n TASK ASSIGNMENT ");
            CatERing.getInstance().getKtcMgr().Assign(sheet.getTasks().get(0), shifts.get(0), x);

            System.out.println(sheet);

            System.out.println("\n[TEST]: TASK SET NEW SHIFT");
            CatERing.getInstance().getKtcMgr().setNewShift(sheet.getTasks().get(0),shifts.get(1));
            System.out.println(sheet);


        }catch (KitchenTaskExcpetion | UseCaseLogicException e){
            System.out.println("Errore nella estensione 5c");
        }




    }
}
