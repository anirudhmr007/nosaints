package com.example.banking.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.banking.entity.BankAccount;
import com.example.banking.repository.BankAccountRepository;

@Service
public class BankingService {

    @Autowired
    private BankAccountRepository accountRepository;

    public List<BankAccount> getAllAccounts() {
        return accountRepository.findAll();
    }

    public BankAccount getAccountByNumber(String accountNumber) {
        Optional<BankAccount> optional = accountRepository.findByAccountNumber(accountNumber);
        return optional.orElse(null);
    }

    public BankAccount registerAccount(BankAccount account) {
        if (account.getAccountBalance() == null) {
            account.setAccountBalance(0.0);
        }
        return accountRepository.save(account);
    }

    // Deposit money with validation
    public String deposit(String accountNumber, Double amount) {
        if (amount == null || amount <= 0) {
            return "Deposit Error: Amount must be greater than zero.";
        }
        BankAccount account = getAccountByNumber(accountNumber);
        if (account == null) {
            return "Deposit Error: Account number not found.";
        }
        account.setAccountBalance(account.getAccountBalance() + amount);
        accountRepository.save(account);
        return "SUCCESS: Successfully deposited $" + amount + ". New Balance: $" + account.getAccountBalance();
    }

    // Withdraw money with validation
    public String withdraw(String accountNumber, Double amount) {
        if (amount == null || amount <= 0) {
            return "Withdrawal Error: Amount must be greater than zero.";
        }
        BankAccount account = getAccountByNumber(accountNumber);
        if (account == null) {
            return "Withdrawal Error: Account number not found.";
        }
        if (account.getAccountBalance() < amount) {
            return "Withdrawal Error: Insufficient funds! Current balance is $" + account.getAccountBalance();
        }
        account.setAccountBalance(account.getAccountBalance() - amount);
        accountRepository.save(account);
        return "SUCCESS: Successfully withdrew $" + amount + ". New Balance: $" + account.getAccountBalance();
    }
}
