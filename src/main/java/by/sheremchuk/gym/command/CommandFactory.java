package by.sheremchuk.gym.command;

public class CommandFactory {
    private static final String FIND_CLIENT_BY_CARD_NUMBER_OR_SURNAME = "Find";
    private static final String ADD_CLIENT = "addClient";

    private static volatile CommandFactory instance;
    private final static Object lock = new Object();

    private CommandFactory() {

    }

    public static CommandFactory getInstance() {
        if (instance == null) {
            synchronized (lock) {
                if (instance == null) {
                    instance = new CommandFactory();
                }
            }
        }

        return instance;
    }

    public Command create(String commandName) {

        Command command = null;

        switch (commandName) {
            case FIND_CLIENT_BY_CARD_NUMBER_OR_SURNAME: {
                command = new FindClientByIdOrSurnameCommand();
            }
            break;
            case ADD_CLIENT: {
                command = new AddClientCommand();
            }
            break;
            default: {
                command = new EmptyCommand();
            }
            break;
        }

        return command;
    }

}
