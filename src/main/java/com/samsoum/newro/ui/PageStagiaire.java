package com.samsoum.newro.ui;

import java.util.ArrayList;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.samsoum.newro.model.Stagiaire;
import com.samsoum.newro.service.ServiceException;
import com.samsoum.newro.service.StagiaireService;


@Component
@Scope("prototype")
public class PageStagiaire {
	public final static int NOMBRES_DE_LIGNES_PAR_DEFAUT = 10;
	public static final int STARTING_PAGE = 1;
	private int numero;
	private int nbLignes = NOMBRES_DE_LIGNES_PAR_DEFAUT;
	private ArrayList<Stagiaire> contenu;
	@Autowired
	private StagiaireService service;

	public PageStagiaire(int numero, int nbLignes, ArrayList<Stagiaire> contenu) {
		super();
		this.numero = numero;
		this.setNbLignes(nbLignes);
		this.contenu = contenu; 
	}

	public int getNumberOfPages() throws PaginationException {
			int nbStagiaires = 12;
			if (service == null) {
				throw new PaginationException();
			}
			return (nbStagiaires / nbLignes) + 1;
	}

	public StagiaireService getService() {
		return service;
	}

	public void setService(StagiaireService service) {
		this.service = service;
	}

	private static boolean hasNext(PageStagiaire page) throws PaginationException {
		int nbPages = page.getNumberOfPages();
		return nbPages > page.getNumero();
	}

	private static boolean hasPrevious(PageStagiaire page) {
		return page.getNumero() > 1;
	}

	public static int next(PageStagiaire page) throws PaginationException, ServiceException {
		// TODO : gérer les fuckings exceptions
		if (PageStagiaire.hasNext(page)) {
			return page.getNumero() + 1;
		} else {
			return page.getNumero();
		}
	}

	public static int previous(PageStagiaire page) throws ServiceException {
		if (PageStagiaire.hasPrevious(page)) {
			return page.getNumero() - 1;
		} else {
			return page.getNumero();
		}
	}

	public int getNumero() {
		return numero;
	}

	public ArrayList<Stagiaire> getContenu() {
		return contenu;
	}

	public int getNbLignes() {
		return nbLignes;
	}

	public void setNbLignes(int nbLignes) {
		this.nbLignes = nbLignes;
	}

	@Override
	public int hashCode() {
		return Objects.hash(contenu, nbLignes, numero);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		PageStagiaire other = (PageStagiaire) obj;
		return Objects.equals(contenu, other.contenu) && nbLignes == other.nbLignes && numero == other.numero;
	}

	@Override
	public String toString() {
		return "Page numéro : " + numero;
	}

}
