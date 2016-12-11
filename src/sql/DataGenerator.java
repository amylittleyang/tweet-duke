package funstuff;

import java.io.File;
import java.io.FileNotFoundException;
import java.net.URISyntaxException;
import java.net.URL;
import java.util.regex.MatchResult;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.*;

public class DataGenerator {
    private static final int numUsers = 999;
    private static final String insertUserStatement = "INSERT INTO \"user\" (uid,name) VALUES ('%s','%s %s');%n";
    private static final String insertSubscriptionStatement = "INSERT INTO \"subscribes\" (uid, category) VALUES ('%s','%s');%n";
    private static final String insertThingStatement = "INSERT INTO \"thing\" (tid,name) VALUES ('%s','%s');%n";
    private static final String insertDirectoryStatement = "INSERT INTO \"directory\" (tid,category) VALUES('%s','%s');%n";
    private static final String insertTagStatement = "INSERT INTO \"tags\" (tid,tag,freq) VALUES ('%s','%s',%d);%n";
    private static final String insertRatingStatement = "INSERT INTO \"ratings\" (uid,tid,rating,timestamp,media) VALUES('%s','%s',%d,'%s','%s');%n";



    private static final String namesFile = "names.txt";
    private static final String categories[] = {"Animals", "Food Places", "Study Places"};
    private static final String media[] = {"/../../media/Cameron_1.jpg", "/../../media/Cameron_2.jpeg", "/../../media/Cameron_3.jpg", "/../../media/Chapel_1.jpg", 
    "/../../media/Chapel_2.jpg", "/../../media/Chape_3.jpg", "/../../media/Chapel_4.jpg", "/../../media/Chapel_5.png", "/../../media/Chapel_6.jpg", "/../../media/Edens_1.jpg", 
    "/../../media/Gardens_1.jpg", "/../../media/Gardens_2.jpg", "/../../media/Gardens_3.jpeg", "/../../media/Gardens_4.jpg", "/../../media/Gardens_5.jpg", "/../../media/Kville_1.jpg", 
    "/../../media/Kville_2.jpg", "/../../media/Kville_3.jpeg", "/../../media/Library_1.jpg", "/../../media/Library_2.jpg", "/../../media/Marketplace_1.jpg", "/../../media/Marketplace_2.jpg", 
    "/../../media/McClendon_1.jpg", "/../../media/McClendon_2.jpg", "/../../media/Penn_1.jpg", "/../../media/Perkins_1.jpg", "/../../media/Perkins_2.jpg", "/../../media/Pitchforks_1.jpg", 
    "/../../media/Pitchforks_2.jpg", "/../../media/Vondy_1.jpg", "/../../media/WestUnion_1.jpg", "/../../media/WestUnion_2.jpg", "/../../media/WestUnion_3.png", "/../../media/WestUnion_4.png"};

    private static final Pattern thingPattern = Pattern.compile("^[^']+");
    private static final Pattern tagPattern = Pattern.compile("'([^']+)'");

    private static Map<Integer, List<String>> thingTags = new HashMap<>();
    private static Map<Integer, String> thingIDs = new HashMap<>();
    private static Random generator = new Random();


    public static void main(String[] args) throws FileNotFoundException, URISyntaxException {

        /* Generate Users */
        URL nameUrl = DataGenerator.class.getResource(namesFile);
        Scanner nameSc = new Scanner(new File(nameUrl.toURI()));
        nameSc.useDelimiter("\\n");
        for (int i = 1; i <= numUsers; i++) {
            nameSc.next("(\\w+)\\s+(\\w+)");
            MatchResult result = nameSc.match();
            System.out.printf(insertUserStatement, i, result.group(1), result.group(2));
        }
        nameSc.close();

        System.out.println();

        /* Generate Subscriptions */
/*        for (int uid = 1; uid <= numUsers; uid++){
            for (int i = 0; i < categories.length; i++){
                if (generator.nextInt(2) == 1) {
                    System.out.printf(insertSubscriptionStatement, uid, categories[i]);
                }
            }
        }

        System.out.println();
*/

        /* Parse though things and Generate Directory*/
        int tidCount = 0;
        for (String category : categories) {
            URL thingUrl = DataGenerator.class.getResource("Categories/" + category + ".txt");
            Scanner thingSc = new Scanner(new File(thingUrl.toURI()));
            while (thingSc.hasNextLine()) {
                String next = thingSc.nextLine();
                Matcher matcher = thingPattern.matcher(next);

                if (matcher.find()) {
                    tidCount++;
                    String thing = matcher.group().trim();
                    thingIDs.put(tidCount, thing);
                    thingTags.put(tidCount, new ArrayList<String>());

                    matcher.usePattern(tagPattern);
                    while (matcher.find()) {
                        String tag = matcher.group(1);
                        thingTags.get(tidCount).add(tag);
                    }

//                    System.out.printf(insertDirectoryStatement, tidCount, category);
                }
            }
            thingSc.close();
        }
        System.out.println();

        /* Generate Things */
        for (Map.Entry<Integer, String> e : thingIDs.entrySet()) {
            System.out.printf(insertThingStatement, e.getKey(), e.getValue());
        }
        System.out.println();

        /* Generate Tags */
        for (Map.Entry<Integer, List<String>> e : thingTags.entrySet()) {
            for (String s : e.getValue()) {
                System.out.printf(insertTagStatement, e.getKey(), s, (int)(Math.abs(generator.nextGaussian()*5) + 1));
            }
        }
        System.out.println();


        /* Generate Ratings */
        for(int i = 0; i < 200; i++) {
            int year = 2015 + generator.nextInt(2); //2015 or 2016
            int month = 1 + generator.nextInt(12); //1 to 12
            String mo = "" + month;
            if (month < 10)
                mo = "0" + month;
            int day = 1 + generator.nextInt(28); //1 to 28
            String d = "" + day;
            if (day < 10)
                d = "0" + day;
            int hour = generator.nextInt(24); //0 to 23
            String h = "" + hour;
            if (hour < 10)
                h = "0" + hour;
            int minute = generator.nextInt(60); //0 to 59
            String m = "" + minute;
            if (minute < 10)
                m = "0" + minute;
            int second = generator.nextInt(60); //0 to 59
            String s = "" + second;
            if (second < 10)
                s = "0" + second;
            String timestamp = year + "-" + mo + "-" + d + " " + h + ":" + m + ":" + s;

            int uid = 1 + generator.nextInt(numUsers); //1 to numUsers
            int tid = 1 + generator.nextInt(tidCount); //1 to numThings
            int rating = 1 + generator.nextInt(5); //1 to 5
            int comment = generator.nextInt(media.length); //0 to media.length

            System.out.printf(insertRatingStatement, uid, tid, rating, timestamp, media[comment]);
        }
    }
}
