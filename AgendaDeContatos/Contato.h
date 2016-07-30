//
//  Contato.h
//  AgendaDeContatos
//
//  Created by Fernando Xavier on 7/30/16.
//  Copyright © 2016 Slackfx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contato : NSObject
/*-(void) setNome: (NSString *) novoNome;
-(NSString *) nome;*/

@property NSString *nome;
@property NSString *endereco;
@property NSString *email;
@property NSString *telefone;
@property NSString *site;

@end
