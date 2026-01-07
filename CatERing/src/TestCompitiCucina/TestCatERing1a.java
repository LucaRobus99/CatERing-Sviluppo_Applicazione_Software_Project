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

public class TestCatERing1a {
    public static void main(String args[]){
        try{

            CatERing.getInstance().getUserManager().fakeLogin("Marinella");
            System.out.println(CatERing.getInstance().getUserManager().getCurrentUser());

            // LOADING DUMMY DATA
            Menu.loadAllMenus();
            ServiceInfo service = ServiceInfo.loadServiceById(2);


            SummarySheet newsheet=CatERing.getInstance().getKtcMgr().generateSummarySheet(service);
            System.out.println("\n[TEST]: OPEN SHEET");
            System.out.println("Opening previously generated summary sheet:\n"+CatERing.getInstance().getKtcMgr().openSheet(newsheet));
            // TEST: End


        }catch (UseCaseLogicException | KitchenTaskExcpetion e ) {
            System.out.println("Errore sulla estensione 1a");
        }
    }
}
