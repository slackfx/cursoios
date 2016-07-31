//
//  ListaContatosViewController.m
//  AgendaDeContatos
//
//  Created by Fernando Xavier on 7/30/16.
//  Copyright © 2016 Slackfx. All rights reserved.
//

#import "ListaContatosViewController.h"
#import "ViewController.h"
#import "Contato.h"

@implementation ListaContatosViewController

//-(ListaContatosViewController * ) init { << mesmo que com id
-(id) init {
    self = [super init];
    
    UIBarButtonItem * botaoForm = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(exibeFormulario)];
    self.navigationItem.rightBarButtonItem = botaoForm;
    self.navigationItem.title = @"Contatos";
    self.contatos = [NSMutableArray new];
    
    return self;
}

-(void) exibeFormulario {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *form = [storyboard instantiateViewControllerWithIdentifier:@"Form-Contato"];
    form.contatos = self.contatos;
    [self.navigationController pushViewController:form animated:YES];
}

-(NSInteger) tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.contatos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identificador = @"Celula";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:identificador];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identificador];
    }

    Contato *contato = self.contatos[indexPath.row];
    cell.textLabel.text = contato.nome;
    return cell;
}

-(void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
}

@end
