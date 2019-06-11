/**
 * Created by Alex on 01.06.2019.
 */
@SuppressWarnings('ApexUnresolvableReference')
public with sharing class CarsController {
    public List<CarWrapperClass> carWrappers { get; set; }
    public Car__c car { get; set; }

    public CarsController() {
        if (carWrappers == null) {
            carWrappers = new List <CarWrapperClass>();
            for (Car__c i : [SELECT Brand__c, Model__c, Price__c, Year__c FROM Car__c ORDER BY Brand__c ASC]) {
                carWrappers.add(new CarWrapperClass(i));
            }
        }
        car = new Car__c();
    }
    public PageReference addCar2() {
        try {
            insert car;
            PageReference pageReference = Page.CarsPage;
            pageReference.setRedirect(true);
            return pageReference;
        } catch (Exception e) {
            e.getMessage();
            System.debug(e.getMessage());
        }
        return null;
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
            try {
                delete car;
                PageReference tempPage = Page.CarsPage;
                tempPage.setRedirect(true);
                return tempPage;
            } catch (Exception e){
                e.getMessage();
                System.debug(e.getMessage());
            }
            return null;
        }

        public void saveMe() {
            try {
                update car;
                isEditMode = false;
                editCarsWindow = false;
            } catch (Exception e) {
                e.getMessage();
                System.debug(e.getMessage());
            }
        }

        public void editTumblerMode() {
            editCarsWindow = !editCarsWindow;
        }

        public void toggleEditModeOn() {
            isEditMode = true;
        }

        public PageReference toggleEditModeOff() {
            isEditMode = false;
            PageReference tempPage = Page.CarsPage;
            tempPage.setRedirect(true);
            return tempPage;
        }
    }
}
