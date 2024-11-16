package model.registry;
import java.time.LocalDate;
import java.time.Year;
import java.util.Scanner;

public class DateBuilder {

    private String day;
    private String month;
    private String year;
    private LocalDate date;
    private Scanner scanner = new Scanner(System.in);

    public LocalDate buildDate(){
        int currentYear = Year.now().getValue();
        day = getInput("day", 1, 31);
        month = getInput("month", 1, 12);
        year = getInput("year", 1, currentYear);

        return date = LocalDate.parse(year + "-" + String.format("%02d", Integer.parseInt(month)) + "-" + String.format("%02d", Integer.parseInt(day)));
    }

    private String getInput(String inputValue, int min, int max) {
        while (true) {
            System.out.println("Enter " + inputValue + ": ");
            String input = scanner.next();
            try {
                int value = Integer.parseInt(input);
                if (value >= min && value <= max) {
                    return input;
                } else {
                    System.out.println("Please enter a valid " + inputValue + " between " + min + " and " + max);
                }
            } catch (NumberFormatException e) {
                System.out.println("Please enter a valid number for " + inputValue);
            }
        }
    }

}
