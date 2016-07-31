//
//  ListaContatosViewController.h
//  AgendaDeContatos
//
//  Created by Fernando Xavier on 7/30/16.
//  Copyright © 2016 Slackfx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContatoDAO.h"
#import "Contato.h"

@interface ListaContatosViewController : UITableViewController

@property ContatoDAO *contatoDAO;

@end
