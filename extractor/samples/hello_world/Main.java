public class Main {
  public static void main(String[] args) {
    HelloWorld hello1 = new HelloWorld();
    HelloWorld hello2 = new HelloWorld();

    hello1.say();
    hello2.say();

    hello1.destroy();
    hello2.destroy();
  }
}

