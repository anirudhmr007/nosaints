package com.example.banking.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.banking.entity.BankAccount;
import com.example.banking.service.BankingService;

@Controller
public class BankingController {

    @Autowired
    private BankingService bankingService;

    // 1. Display all registered customer accounts in a JSP table
    @GetMapping({"/", "/accounts"})
    public String viewAccountsPage(Model model) {
        model.addAttribute("accounts", bankingService.getAllAccounts());
        return "account-list";
    }

    // 2. Show registration form for new customer account
    @GetMapping("/accounts/new")
    public String showRegisterForm(Model model) {
        model.addAttribute("account", new BankAccount());
        return "account-register";
    }

    // 3. Register customer and save bank account
    @PostMapping("/accounts/register")
    public String registerAccount(@ModelAttribute("account") BankAccount account, Model model) {
        // Simple check for duplicate account number
        if (bankingService.getAccountByNumber(account.getAccountNumber()) != null) {
            model.addAttribute("errorMessage", "Error: Account number already exists!");
            model.addAttribute("account", account);
            return "account-register";
        }
        bankingService.registerAccount(account);
        return "redirect:/accounts";
    }

    // 4. Search for customer account using Account Number & Display Current Balance
    @GetMapping("/accounts/search")
    public String searchAccount(@RequestParam(value = "accountNumber", required = false) String accountNumber, Model model) {
        if (accountNumber == null || accountNumber.trim().isEmpty()) {
            return "redirect:/accounts";
        }
        BankAccount account = bankingService.getAccountByNumber(accountNumber.trim());
        if (account != null) {
            model.addAttribute("selectedAccount", account);
        } else {
            model.addAttribute("errorMessage", "No bank account found with Account Number: " + accountNumber);
        }
        model.addAttribute("accounts", bankingService.getAllAccounts());
        return "account-list";
    }

    // 5. Deposit money into bank account with validation
    @PostMapping("/accounts/deposit")
    public String depositMoney(@RequestParam("accountNumber") String accountNumber,
                               @RequestParam("amount") Double amount,
                               Model model) {
        String result = bankingService.deposit(accountNumber, amount);
        if (result.startsWith("SUCCESS")) {
            model.addAttribute("successMessage", result);
        } else {
            model.addAttribute("errorMessage", result);
        }
        model.addAttribute("selectedAccount", bankingService.getAccountByNumber(accountNumber));
        model.addAttribute("accounts", bankingService.getAllAccounts());
        return "account-list";
    }

    // 6. Withdraw money from bank account with validation
    @PostMapping("/accounts/withdraw")
    public String withdrawMoney(@RequestParam("accountNumber") String accountNumber,
                                @RequestParam("amount") Double amount,
                                Model model) {
        String result = bankingService.withdraw(accountNumber, amount);
        if (result.startsWith("SUCCESS")) {
            model.addAttribute("successMessage", result);
        } else {
            model.addAttribute("errorMessage", result);
        }
        model.addAttribute("selectedAccount", bankingService.getAccountByNumber(accountNumber));
        model.addAttribute("accounts", bankingService.getAllAccounts());
        return "account-list";
    }
}
