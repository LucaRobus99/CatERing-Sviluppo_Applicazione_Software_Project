package businesslogic.event;

import businesslogic.menu.Menu;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import persistence.PersistenceManager;
import persistence.ResultHandler;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;

public class ServiceInfo implements EventItemInfo {
    private int id;
    private String name;
    private Date date;
    private Time timeStart;
    private Time timeEnd;
    private int participants;

    private Menu menuAssigned;

    public ServiceInfo(String name) {
        this.name = name;
    }

    public ServiceInfo() {

    }

    public String toString() {
        return name + ": " + date + " (" + timeStart + "-" + timeEnd + "), " + participants + " partecipants.";
    }

    public int getId() {
        return id;
    }

    public Menu getMenuAssigned() {
        return menuAssigned;
    }

    // STATIC METHODS FOR PERSISTENCE

    public static ObservableList<ServiceInfo> loadServiceInfoForEvent(int event_id) {
        ObservableList<ServiceInfo> result = FXCollections.observableArrayList();
        String query = "SELECT id, name, service_date, time_start, time_end, expected_participants, approved_menu_id " +
                "FROM Services WHERE event_id = " + event_id;
        PersistenceManager.executeQuery(query, new ResultHandler() {
            @Override
            public void handle(ResultSet rs) throws SQLException {
                String s = rs.getString("name");
                ServiceInfo service = new ServiceInfo(s);
                service.id = rs.getInt("id");
                service.date = rs.getDate("service_date");
                service.timeStart = rs.getTime("time_start");
                service.timeEnd = rs.getTime("time_end");
                service.participants = rs.getInt("expected_participants");
                service.menuAssigned = Menu.getMenuById(rs.getInt("approved_menu_id"));
                result.add(service);
            }
        });

        return result;
    }

    public static ServiceInfo loadServiceById(int id) {
        ServiceInfo service = new ServiceInfo();
        String query = "SELECT * FROM Services WHERE id=" + id;
        PersistenceManager.executeQuery(query, new ResultHandler() {
            @Override
            public void handle(ResultSet rs) throws SQLException {
                service.name = rs.getString("name");
                service.id = rs.getInt("id");
                service.date = rs.getDate("service_date");
                service.timeStart = rs.getTime("time_start");
                service.timeEnd = rs.getTime("time_end");
                service.participants = rs.getInt("expected_participants");
                service.menuAssigned = Menu.getMenuById(rs.getInt("approved_menu_id"));
            }
        });
        return service;
    }
}
