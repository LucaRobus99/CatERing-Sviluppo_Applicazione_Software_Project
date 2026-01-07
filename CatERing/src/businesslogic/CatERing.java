package businesslogic;

import businesslogic.KitchenTask.KitchenTaskManager;
import businesslogic.event.EventManager;
import businesslogic.menu.Menu;
import businesslogic.menu.MenuManager;
import businesslogic.recipe.RecipeManager;
import businesslogic.shift.Shift;
import businesslogic.shift.ShiftManager;
import businesslogic.user.UserManager;
import persistence.KitchenTaskPersistence;
import persistence.MenuPersistence;
import persistence.PersistenceManager;

public class CatERing {
    private static CatERing singleInstance;

    public static CatERing getInstance() {
        if (singleInstance == null) {
            singleInstance = new CatERing();
        }
        return singleInstance;
    }

    private MenuManager menuMgr;
    private RecipeManager recipeMgr;
    private UserManager userMgr;
    private EventManager eventMgr;
    private KitchenTaskManager ktcMgr;
    private ShiftManager shiftMgr;
    private MenuPersistence menuPersistence;
    private KitchenTaskPersistence kitchenTaskPersistence;



    private CatERing() {
        menuMgr = new MenuManager();
        recipeMgr = new RecipeManager();
        userMgr = new UserManager();
        eventMgr = new EventManager();
        ktcMgr = new KitchenTaskManager();
        shiftMgr = new ShiftManager();
        menuPersistence = new MenuPersistence();
        menuMgr.addEventReceiver(menuPersistence);
        kitchenTaskPersistence = new KitchenTaskPersistence();
        ktcMgr.addEventReceiver(kitchenTaskPersistence);
    }


    public MenuManager getMenuManager() {
        return menuMgr;
    }

    public RecipeManager getRecipeManager() {
        return recipeMgr;
    }

    public UserManager getUserManager() {
        return userMgr;
    }
    public ShiftManager getShiftManager() {return shiftMgr;}
    public EventManager getEventManager() { return eventMgr; }

    public KitchenTaskManager getKtcMgr() {return ktcMgr;}
}
