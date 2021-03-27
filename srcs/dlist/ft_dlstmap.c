/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_dlstmap.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: kefujiwa <kefujiwa@student.42tokyo.jp>     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/03/27 15:11:00 by kefujiwa          #+#    #+#             */
/*   Updated: 2021/03/27 15:13:03 by kefujiwa         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

t_dlist	*ft_dlstmap(t_dlist *lst, void *(*f)(void*), void (*del)(void*))
{
	t_dlist	*head;
	t_dlist	*new;

	if (!lst || !f)
		return (NULL);
	head = NULL;
	while (lst)
	{
		new = ft_dlstnew(f(lst->content));
		if (!new)
		{
			ft_dlstclear(&head, del);
			return (NULL);
		}
		ft_dlstadd_back(&head, new);
		lst = lst->next;
	}
	return (head);
}
