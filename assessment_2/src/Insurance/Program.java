package Insurance;

import java.util.Scanner;

public class Program {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Insurance Number: ");
        String insuranceNo = scanner.nextLine();

        System.out.print("Insurance Name: ");
        String insuranceName = scanner.nextLine();

        System.out.print("Amount Covered: ");
        double amountCovered = scanner.nextDouble();

        System.out.println("Select\n1. Life Insurance\n2. Motor Insurance");
        int option = scanner.nextInt();

        Insurance insurance;
        if (option == 1) {
            LifeInsurance lifeInsurance = new LifeInsurance();
            lifeInsurance.setInsuranceNo(insuranceNo);
            lifeInsurance.setInsuranceName(insuranceName);
            lifeInsurance.setAmountCovered(amountCovered);

            System.out.print("Policy Term: ");
            int policyTerm = scanner.nextInt();
            lifeInsurance.setPolicyTerm(policyTerm);

            System.out.print("Benefit Percent: ");
            float benefitPercent = scanner.nextFloat();
            lifeInsurance.setBenefitPercent(benefitPercent);

            insurance = lifeInsurance;
        } else {
            MotorInsurance motorInsurance = new MotorInsurance();
            motorInsurance.setInsuranceNo(insuranceNo);
            motorInsurance.setInsuranceName(insuranceName);
            motorInsurance.setAmountCovered(amountCovered);

            System.out.print("Depreciation Percent: ");
            float depPercent = scanner.nextFloat();
            motorInsurance.setDepPercent(depPercent);

            insurance = motorInsurance;
        }

        double premium = addPolicy(insurance, option);
        System.out.println("Calculated Premium: " + premium);
    }

    public static double addPolicy(Insurance ins, int opt) {
        if (opt == 1) {
            return ((LifeInsurance) ins).calculatePremium();
        } else {
            return ((MotorInsurance) ins).calculatePremium();
        }
    }
}

