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
#import "ViewController.h"

@interface ListaContatosViewController : UITableViewController<ViewControllerDelegate>

@property ContatoDAO *contatoDAO;
@property Contato *contatoSelecionado;

@property NSInteger linhaSelecionada;

@end
