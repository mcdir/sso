#验证 module interface documentation

* The sender of the message `ISender` (leading to send information objects, such as sending a check code to the phone, sent to the mailbox)
* Information storage `IStore` (responsible for storing information sent by the sender)
* Information generator `InformativeGenerator` (responsible for generating the information that the sender needs to send)
* Information Validator `IValidator` (responsible for verifying data)

## Process
1. The information generator is responsible for generating data for the sender of the message
2. Send successfully saved
3. Verify successful deletion

## Configuration

```properties
Sso.validate.mail.enable=true
Sso.validate.mail.from=${spring.mail.username}
Sso.validate.mail.content=Unified portal registration verification code: %s
Sso.validate.mail.subject=Unified Portal Registration
```

## Program Send

```java
@Autowired
Private DefaultValidateService validateService;

//verification
@PostMapping
Public String registry(Model model, HttpServletRequest request, @Valid RegistryInfoVo registryInfoVo) {
        ValidateResult result = validateService.validate(
                New MailValidateCredential(request.getSession().getId(), registryInfoVo.getEmail(),
                        "registry", registryInfoVo.getValidateCode()));
    If (result == ValidateResult.FAIL) {
        model.addAttribute("validateError", "Verification code error");
    } else if (result == ValidateResult.EXPIRED) {
        model.addAttribute("validateError", "Verification code has expired");
    }
    Return "registryView";
}


//send
validateService.send(new MailCredential(request.getSession().getId(), mail, "registry"));
           
```