package com.example.client.Program;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.*;
import org.openqa.selenium.firefox.FirefoxDriver;

public class WebDriverInterface {
    public static void main(String[] args) {
        //System.setProperty("webdriver.chrome.driver","E:\\Meeting Scheduler\\Client\\lib\\chromedriver.exe");
        WebDriver driver = new FirefoxDriver();
        String baseUrl = "https://chat.1410inc.xyz";
        driver.get(baseUrl);

        WebElement roomname = driver.findElement(By.id("room-name"));

        WebElement username = driver.findElement(By.id("your-name"));

        WebElement createroom = driver.findElement(By.id("create-room"));

        roomname.sendKeys("Room 1");
        username.sendKeys("Mohamed 1");

        createroom.click();
        System.out.println("Signed in with Click");
        driver.close();

    }
}