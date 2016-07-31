//
//  ViewController.h
//  AgendaDeContatos
//
//  Created by Fernando Xavier on 7/30/16.
//  Copyright © 2016 Slackfx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContatoDAO.h"

@interface ViewController : UIViewController

@property IBOutlet UITextField *nome;
@property IBOutlet UITextField *endereco;
@property IBOutlet UITextField *email;
@property IBOutlet UITextField *telefone;
@property IBOutlet UITextField *site;

@property ContatoDAO *contatoDAO;

@end

