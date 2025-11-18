@isTest
public class HelloWorldTest {
  @isTest
  public static void hello() {
    String result = HelloWorld.hello();

    Assert.areEqual(result, 'Hello World!', 'Greeting does not match.');
  }
}
