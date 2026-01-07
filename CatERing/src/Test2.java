import businesslogic.CatERing;
import businesslogic.event.ServiceInfo;
import businesslogic.KitchenTask.KitchenTaskExcpetion;
import businesslogic.UseCaseLogicException;
import businesslogic.menu.Menu;
import businesslogic.recipe.Recipe;
import businesslogic.shift.Shift;
import businesslogic.KitchenTask.SummarySheet;
import businesslogic.user.User;

import java.util.ArrayList;

public class Test2 {

    public static void main(String args[]){
            try {
            System.out.println("[TEST]: FAKE LOGIN");
            CatERing.getInstance().getUserManager().fakeLogin("Marinella");
            System.out.println(CatERing.getInstance().getUserManager().getCurrentUser());
            ArrayList<Recipe> r= new ArrayList<> (Recipe.getAllRecipes());
                ArrayList<Shift> tu= CatERing.getInstance().getKtcMgr().checkShiftBoard();

            Menu.loadAllMenus();
            ServiceInfo service = ServiceInfo.loadServiceById(2);
            System.out.println(service.toString());

                SummarySheet sheet = CatERing.getInstance().getKtcMgr().generateSummarySheet(service);
                System.out.println("Open first sheet: \n" + CatERing.getInstance().getKtcMgr().openSheet(sheet));


                //CatERing.getInstance().getKtcMgr().deleteTask(sheet.getTasks().get(0));
                //CatERing.getInstance().getKtcMgr().sortTask(sheet.getTasks().get(0),2);
                //System.out.println("Open first sheet: \n" + CatERing.getInstance().getKtcMgr().openSheet(sheet));
                User x=User.loadUserById(5);
                x.setAvaible(true);
                CatERing.getInstance().getKtcMgr().Assign(sheet.getTasks().get(0),tu.get(0),x);

               /* CatERing.getInstance().getKtcMgr().setTaskDetails(sheet.getTasks().get(0),30,20);
                CatERing.getInstance().getKtcMgr().changeTaskQuantity(sheet.getTasks().get(0),30);
                CatERing.getInstance().getKtcMgr().changeTaskTimeEstimate(sheet.getTasks().get(0),20);
                System.out.println("Open first sheet: \n" + CatERing.getInstance().getKtcMgr().openSheet(sheet));*/



        } catch (UseCaseLogicException | KitchenTaskExcpetion e ) {
                System.out.println("Errore sullo scenario principale" + e);
        }
    }
}
