package TestCompitiCucina;

import businesslogic.CatERing;
import businesslogic.KitchenTask.KitchenTask;
import businesslogic.KitchenTask.KitchenTaskExcpetion;
import businesslogic.KitchenTask.SummarySheet;
import businesslogic.UseCaseLogicException;
import businesslogic.event.ServiceInfo;
import businesslogic.menu.Menu;
import businesslogic.recipe.Recipe;
import businesslogic.user.User;

import java.util.ArrayList;

public class TestCatERing2a {

    public static void main(String arg []) {
        try {
            CatERing.getInstance().getUserManager().fakeLogin("Marinella");
            System.out.println(CatERing.getInstance().getUserManager().getCurrentUser());

            // LOADING DUMMY DATA
            Menu.loadAllMenus();
            ServiceInfo service = ServiceInfo.loadServiceById(2);


            System.out.println("\nGENERATING NEW SUMMARY SHEET:\n");
            SummarySheet sheet = CatERing.getInstance().getKtcMgr().generateSummarySheet(service);
            System.out.println(sheet+"\n");

            KitchenTask taskToDelete=sheet.getTasks().get(0);
            System.out.println("KitchenTask to delete:\s"+taskToDelete+"\n");


            System.out.println("\n[TEST]: DELETE  TASK");
            CatERing.getInstance().getKtcMgr().deleteTask(taskToDelete);


            System.out.println(sheet);
        } catch (UseCaseLogicException | KitchenTaskExcpetion e) {
            System.out.println("Errore sulla estensione 2a" + e);
        }
    }
}
