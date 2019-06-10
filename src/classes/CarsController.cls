/**
 * Created by Alex on 01.06.2019.
 */
@SuppressWarnings('ApexUnresolvableReference')
public with sharing class CarsController {
    public List<CarWrapperClass> carWrappers { get; set; }
    public String model { get; set; }
    public String brand { get; set; }
    public Double price { get; set; }
    public String year { get; set; }

    public CarsController() {
        if (carWrappers == null) {
            carWrappers = new List <CarWrapperClass>();
            for (Car__c i : [SELECT Brand__c, Model__c, Price__c, Year__c FROM Car__c ORDER BY Brand__c ASC]) {
                carWrappers.add(new CarWrapperClass(i));
            }
        }
    }

    public void addCar() {
        Car__c car = new Car__c(Brand__c = brand, Model__c = model, Price__c = price, Year__c = year);
        insert car;
    }

    class CarWrapperClass {
        public Car__c car { get; set; }
        public Boolean isEditMode { get; set; }
        public Boolean editCarsWindow { get; set; }

        public CarWrapperClass(Car__c car) {
            this.car = car;
            isEditMode = false;
            editCarsWindow = false;
        }

        public PageReference deleteCar() {
            delete car;
            PageReference tempPage = Page.CarsPage;
            tempPage.setRedirect(true);
            return tempPage;
        }

        public void saveMe() {
            update car;
            isEditMode = false;
            editCarsWindow = false;
        }

        public void editTumblerMode() {
            editCarsWindow = !editCarsWindow;
        }

        public void toggleEditMode() {
            isEditMode = !isEditMode;
        }
    }
}
