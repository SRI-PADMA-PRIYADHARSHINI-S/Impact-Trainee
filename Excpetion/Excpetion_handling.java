package Excpetion;

import java.io.File;
import java.io.FileNotFoundException;
import java.lang.annotation.AnnotationTypeMismatchException;
import java.util.Scanner;

public class Excpetion_handling {

    // Method to demonstrate ArithmeticException
    public static void ArithmeticException() {
        try {
            int result = 10 / 0;  // Division by zero
        } catch (ArithmeticException e) {
            System.out.println("Caught ArithmeticException: " + e.getMessage());
        }
    }

    // Method to demonstrate ArrayIndexOutOfBoundsException
    public static void ArrayIndexOutOfBoundsException() {
        try {
            int[] arr = new int[3];
            arr[5] = 10;  // Invalid array index
        } catch (ArrayIndexOutOfBoundsException e) {
            System.out.println("Caught ArrayIndexOutOfBoundsException: " + e.getMessage());
        }
    }

    // Method to demonstrate NullPointerException
    public static void NullPointerException() {
        try {
            String str = null;
            System.out.println(str.length());  // Null object reference
        } catch (NullPointerException e) {
            System.out.println("Caught NullPointerException: " + e.getMessage());
        }
    }

    // Method to demonstrate NumberFormatException
    public static void NumberFormatException() {
        try {
            String str = "abc";
            int number = Integer.parseInt(str);  // Invalid conversion
        } catch (NumberFormatException e) {
            System.out.println("Caught NumberFormatException: " + e.getMessage());
        }
    }

    // Method to demonstrate InputMismatchException
    public static void InputMismatchException() {
        try {
            Scanner scanner = new Scanner(System.in);
            System.out.print("Enter a number: ");
            int num = scanner.nextInt();  // User might enter a non-integer value
        } catch (MatchException e) {
            System.out.println("Caught InputMismatchException: " + e.getMessage());
        }
    }

    // Method to demonstrate FileNotFoundException
    public static void FileNotFoundException() {
        try {
            File file = new File("non_existent_file.txt");
            Scanner fileScanner = new Scanner(file);  // File does not exist
        } catch (FileNotFoundException e) {
            System.out.println("Caught FileNotFoundException: " + e.getMessage());
        }
    }

    // Method to demonstrate ClassCastException
    public static void ClassCastException() {
        try {
            Object obj = "Hello";
            Integer num = (Integer) obj;  // Invalid type casting
        } catch (ClassCastException e) {
            System.out.println("Caught ClassCastException: " + e.getMessage());
        }
    }

    // Method to demonstrate IllegalArgumentException
    public static void IllegalArgumentException() {
        try {
            Thread.sleep(-1000);  // Invalid argument to sleep method (negative time)
        } catch (IllegalArgumentException | InterruptedException e) {
            System.out.println("Caught IllegalArgumentException: " + e.getMessage());
        }
    }

    public static void main(String[] args) {
        System.out.println("Demonstrating various exceptions in Java:");

        ArithmeticException();
        ArrayIndexOutOfBoundsException();
        NullPointerException();
        NumberFormatException();
        InputMismatchException();
        FileNotFoundException();
        ClassCastException();
        IllegalArgumentException();

        System.out.println("Program execution completed.");
    }
}

