//
//  ContatoDAO.h
//  AgendaDeContatos
//
//  Created by Fernando Xavier on 7/31/16.
//  Copyright © 2016 Slackfx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contato.h"

@interface ContatoDAO : NSObject

@property NSMutableArray *contatos;

-(void) adicionaContato:(Contato *) contato;

-(NSInteger) total;

-(Contato *) contatoDoIndice:(NSInteger) indice;

+(ContatoDAO *) contatoDAOInstance;

-(void) removeContato: (Contato *) contato;

-(NSInteger) indiceDoContato: (Contato *) contato;

@end
