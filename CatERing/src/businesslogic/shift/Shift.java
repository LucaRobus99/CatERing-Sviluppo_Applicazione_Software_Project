package businesslogic.shift;

import businesslogic.user.User;
import javafx.collections.FXCollections;
import javafx.collections.ObservableMap;
import persistence.PersistenceManager;
import persistence.ResultHandler;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;
import java.util.Date;
import java.util.EnumSet;
import java.util.Set;

public class Shift {
    private int id;
    private Date date;
    private String place;
    private Time start;
    private Time end;

    private boolean Full;
    private boolean Over;
    private Type type;

    public static enum Type {PREPARATORIO, SERVIZIO}

    public static ArrayList<Shift> loadAllTurns() {
        ArrayList<Shift> turns = new ArrayList<>();

        String query = "SELECT * FROM turns WHERE type= 'p' ";
        PersistenceManager.executeQuery(query, new ResultHandler() {
            @Override
            public void handle(ResultSet rs) throws SQLException {
                Shift t = new Shift();
                t.id = rs.getInt("id");
                t.date = rs.getDate("date");
                t.start = rs.getTime("h_start");
                t.end = rs.getTime("h_end");
                t.place = rs.getString("place");
                t.Over=rs.getBoolean("over");
                t.Full=rs.getBoolean("full");
                String typeFromDB = rs.getString("type");
                if (typeFromDB != null && typeFromDB.trim().equalsIgnoreCase("p")) t.type = Type.PREPARATORIO;
                if (typeFromDB != null && typeFromDB.trim().equalsIgnoreCase("s")) t.type = Type.SERVIZIO;


                turns.add(t);
            }
        });
        return turns;
    }

    @Override
    public String toString() {
        return "\n\t\tid: " + id +
                ", date: " + date +
                ", place: " + place + '\'' +
                ", start: " + start +
                ", end: " + end+
                ",full: "+Full+
                ",over:"+Over+
                ",type: "+type;
    }
    public boolean isFull(){
        return Full ;
    }
    public boolean isOver(){
        return Over;
    }

    public int getId() {
        return id;
    }
}
